local agroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local async = require("plenary.async")
local Job = require("plenary.job")

local fn = vim.fn
local get_option = vim.api.nvim_buf_get_option

-----------------------------------------
function prt(val)
  -- print(val)
  local k = vim.inspect(val)
  vim.opt.ch = 10
end
-----------------------------------------
-- try to get git env status
-- autocmd({ "BufRead" }, {
--   desc = "Add a enviroment status var definition",
--   -- pattern = { '*.log' },
--   -- command = 'set filetype=log',
--   callback = function()
--     Job:new({
--       command = "git",
--       args = { "rev-parse", "--abbrev-ref", "HEAD"} ,
--       cwd = vim.fn.getcwd(),
--       on_stdout = function(e, v)
--         if v then
--           vim.b.walo_git_head_cwd=v
--         end
--       end,
--     }):start() -- or start()
--   end,
-- })

autocmd({ "VimEnter" }, {
  desc = "Add starter view",
  -- pattern = { '*.log' },
  -- command = 'set filetype=log',
  callback = function()
    local should_skip
    local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)
    if
      vim.fn.argc() > 0 -- don't start when opening a file
      or #lines > 1 -- don't open if current buffer has more than 1 line
      or (#lines == 1 and lines[1]:len() > 0) -- don't open the current buffer if it has anything on the first line
      or #vim.tbl_filter(function(bufnr)
        return vim.bo[bufnr].buflisted
      end, vim.api.nvim_list_bufs()) > 1 -- don't open if any listed buffers
      or not vim.o.modifiable -- don't open if not modifiable
    then
      should_skip = true
    else
      for _, arg in pairs(vim.v.argv) do
        if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
          should_skip = true
          break
        end
      end
    end
    if should_skip then
      return
    end
    --require("alpha").start(true, require("alpha").default_config)
    require("mini.starter")
    MiniStarter.open()

    -- Job:new({
    --   command = "git",
    --   args = { "rev-parse", "--abbrev-ref", "HEAD"} ,
    --   cwd = vim.fn.getcwd(),
    --   on_stdout = function(e, v)
    --     if v then
    --       vim.b.walo_git_head_cwd=v
    --     end
    --   end,
    -- }):start() -- or start()
  end,
})

autocmd({ "VimEnter", "BufEnter", "BufAdd" }, {
  desc = "Add icon to file",
  -- pattern = { '*.log' },
  -- command = 'set filetype=log',
  callback = function()
    local ok, devicons = pcall(require, "nvim-web-devicons")
    if not ok then
      return
    end
    local filename = vim.fn.expand("%:t")
    local filetype = vim.bo.filetype

    local icon, color_icon = nil, nil
    icon, color_icon = devicons.get_icon_color(filename, vim.fn.expand("%:e"))
    -- if icon then
    --   vim.api.nvim_set_hl(0, "DevIcon" .. vim.fn.fnamemodify(filename, ":e"), { fg = color_icon })
    --   vim.cmd("syntax match DevIcon" .. vim.fn.fnamemodify(filename, ":e") .. " /" .. icon .. "/")
    -- else
    --   vim.api.nvim_set_hl(0, "DevIcon" .. vim.fn.fnamemodify(filename, ":e"), {})
    --   vim.cmd("syntax match DevIcon" .. vim.fn.fnamemodify(filename, ":e") .. " /" .. filename .. "/")
    -- end
    vim.b.filepeicon = icon
    -- uppercase the firs letter of the filetype
    local first_letter = string.upper(string.sub(filetype, 1, 1))
    -- vim.b.filepeicon = first_letter .. string.sub(filetype, 2)
    vim.b.filepeiconcolor = "%#DevIcon" .. first_letter .. string.sub(filetype, 2) .. "#"
  end,
})
