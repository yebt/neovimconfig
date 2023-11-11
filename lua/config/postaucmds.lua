local agroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local async = require("plenary.async")
local Job = require("plenary.job")

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
    require('mini.starter')
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
