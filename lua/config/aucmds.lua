local agroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
-- local user_cmd = vim.api.nvim_create_user_command

-- Fucntions
--------------------------------------------

-- Is aviable a plugin
local is_aviable = require("utils.functions").is_aviable

-- Shelude event
local function event(ev)
  vim.shedule(function()
    vim.api.nvim_exec_autocmds("User", { pattern = ev })
  end)
end

-- on events
--------------------------------------------

-- cool vim with autocmd
vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, vim.api.nvim_create_namespace("auto_hlsearch"))

-- Autocommands
--------------------------------------------

-- Unlist buffers
-- bf, starter
autocmd("FileType", {
  desc = "Unlist quickfist buffers",
  group = agroup("_unlist_quickfist", { clear = true }),
  pattern = { "qf", "starter" },
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Quick close
autocmd("FileType", {
  group = agroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "runner",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Automake the views

local view_group = agroup("_auto_view", { clear = true })

-- Make view
autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
  desc = "Save view with mkview for real files",
  group = view_group,
  callback = function(event)
    if vim.b[event.buf].view_activated then
      vim.cmd.mkview({ mods = { emsg_silent = true } })
    end
  end,
})

-- Load view
autocmd("BufWinEnter", {
  desc = "Try to load file view if available and enable view saving for real files",
  group = view_group,
  callback = function(event)
    if not vim.b[event.buf].view_activated then
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = event.buf })
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = event.buf })
      local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
      if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
        vim.b[event.buf].view_activated = true
        vim.cmd.loadview({ mods = { emsg_silent = true } })
      end
    end
  end,
})

-- -- Last location
-- autocmd('BufReadPost', {
--   group = agroup('_last_loc', { clear = true }),
--   callback = function()
--     local mark = vim.api.nvim_buf_get_mark(0, '"')
--     local lcount = vim.api.nvim_buf_line_count(0)
--     if mark[1] > 0 and mark[1] <= lcount then
--       pcall(vim.api.nvim_win_set_cursor, 0, mark)
--     end
--   end,
-- })

-- HighLight Yanke Text
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = agroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Terminal managing
local c = agroup("TERMING", { clear = true })
autocmd({ "TermOpen" }, {
  pattern = { "*" },
  group = c,
  command = [[setlocal nonumber | setlocal norelativenumber | setlocal  signcolumn=no|startinsert]],
})
autocmd({ "BufEnter", "WinEnter" }, { pattern = { "term://*" }, group = c, command = [[startinsert]] })
autocmd({ "BufLeave" }, { pattern = { "term://*" }, group = c, command = [[stopinsert]] })

-- Filetypes
autocmd({ "BufNewFile", "BufRead" }, {
  desc = "Recognize iwaylog files",
  pattern = { "*.iwaylog" },
  command = "set filetype=iwaylog",
})

autocmd({ "BufNewFile", "BufRead" }, {
  desc = "Recognize log files",
  pattern = { "*.log" },
  command = "set filetype=log",
})

-- autocmd({'Filetype'}, {
--   desc = 'Vim autocomplete HTML tags',
--   pattern = { 'html' },
--   command = 'set omnifunc=htmlcomplete#CompleteTags',
-- })

-- autocmd({ 'BufNewFile' }, {
--   desc = 'Add skeleton support',
--   callback = function()
--     --local ft =  vim.bo.filetype
--     --local ft =  vim.api.nvim_buf_get_option(0,"filetype")
--
--     local ext = vim.fn.expand('%:e')
--     local buf_name = vim.fn.expand('%:t')
--
--     local file_ext_exceptions = {}
--     local file_name_exceptions = {
--       -- ["web.php"] =  "skeleton.web.php"
--     }
--
--     local skeleton_name = 'skeleton.' .. ext
--     if file_name_exceptions[buf_name] then
--       skeleton_name = file_name_exceptions[buf_name]
--     elseif file_ext_exceptions[buf_name] then
--       skeleton_name = file_ext_exceptions[buf_name]
--     end
--
--     -- Verifica si el archivo de esqueleto existe
--     local template_path = vim.fn.expand('~/.config/nvim/templates/' .. skeleton_name)
--     if vim.fn.filereadable(template_path) == 1 then
--       -- Ejecuta la acción para leer el esqueleto y pegarlo al principio del buffer
--       vim.cmd(':silent 0r ' .. template_path)
--       vim.notify('Template loaded for new file from ->  ' .. skeleton_name)
--     end
--   end,
-- })
