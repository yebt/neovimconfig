return function()
  -- Set new colorschemes
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      -- Fix cursor on matchparent viewview  problem
      -- vim.api.nvim_set_hl(0, "MatchParen", { fg = "#FFAF5F", bold=true})
      -- Cursor
      -- highlight Cursor guifg=white guibg=black
      -- highlight iCursor guifg=white guibg=steelblue
      -- set guicursor=n-v-c:block-Cursor
      -- set guicursor+=i:ver100-iCursor
      -- set guicursor+=n-v-c:blinkon0
      -- set guicursor+=i:blinkwait10

      -- -- vim.api.nvim_set_hl(0, "CursorLineNr", { cterm = bold, bold = true })
      -- local c = vim.api.nvim_get_hl_by_name("StatusLine", true)
      -- --
      -- vim.api.nvim_set_hl(0, "StatusLine", { fg = "#BFFFF1", bg = c.background })
      -- vim.api.nvim_set_hl(0, "Visual", { bg = "#252525" })
      -- -- vim.api.nvim_set_hl(0, "Visual", { bg = "#000000"})
      -- -- vim.notify(vim.inspect(c))
    end,
  })
end
