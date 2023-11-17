-- local default = "habamax"

-- local plugin = vim.g.walo_colorscheme_plugin or "night-owl.nvim"
-- local colorscheme = vim.g.walo_colorscheme_name or "night-owl"
-- -- local colorscheme = "vitesseo"
-- local is_available = require("utils.functions").is_available

-- local selected_colorscheme = is_available(plugin) and colorscheme or default

-- local ok, cllbck = pcall(require, "plugin.config." .. selected_colorscheme)

-- if ok then
--   cllbck()
-- end

-- vim.cmd.colorscheme(selected_colorscheme)



  -- hl(0, "GitSignsAdd", { fg = c.sign_add, bg = 'NONE' })
  -- hl(0, "GitSignsChange", { fg = c.sign_change, bg = 'NONE' })
  -- hl(0, "GitSignsDelete", { fg = c.sign_delete, bg = 'NONE' })
  -- hl(0, "GitSignsChangedelete", { fg = c.sign_change, bg = 'NONE' })
  -- hl(0, "GitSignsCurrentLineBlame", { fg = c.gray3, bg = 'NONE' })
  -- hl(0, "GitGutterAdd", { fg = c.sign_add, bg = 'NONE' })
  -- hl(0, "GitGutterChange", { fg = c.sign_change, bg = 'NONE' })
  -- hl(0, "GitGutterDelete", { fg = c.sign_delete, bg = 'NONE' })
  -- hl(0, "GitGutterChangeDelete", { fg = c.sign_change, bg = 'NONE' })

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     local hl = vim.api.nvim_set_hl
--     -- Fix cursor on matchparent viewview  problem
--     -- vim.api.nvim_set_hl(0, "MatchParen", { fg = "#FFAF5F", bold=true})
--     -- Cursor
--     -- highlight Cursor guifg=white guibg=black
--     -- highlight iCursor guifg=white guibg=steelblue
--     -- set guicursor=n-v-c:block-Cursor
--     -- set guicursor+=i:ver100-iCursor
--     -- set guicursor+=n-v-c:blinkon0
--     -- set guicursor+=i:blinkwait10

--     -- -- vim.api.nvim_set_hl(0, "CursorLineNr", { cterm = bold, bold = true })
--     -- local c = vim.api.nvim_get_hl_by_name("StatusLine", true)
--     -- --
--     -- vim.api.nvim_set_hl(0, "StatusLine", { fg = "#BFFFF1", bg = c.background })
--     -- vim.api.nvim_set_hl(0, "Visual", { bg = "#252525" })
--     -- -- vim.api.nvim_set_hl(0, "Visual", { bg = "#000000"})
--     -- -- vim.notify(vim.inspect(c))
--   end,
-- })
