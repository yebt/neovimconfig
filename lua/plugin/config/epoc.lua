return function()
  local ok, epo = pcall(require, "epo")
  if not ok then
    return
  end

  local opts = {
    -- fuzzy match
    fuzzy = true,
    -- increase this value can aviod trigger complete when delete character.
    debounce = 50,
    -- when completion confrim auto show a signature help floating window.
    signature = true,
    -- vscode style json snippet path
    -- snippet_path = nil,
    snippet_path = "/home/eb/.local/share/nvim/lazy/friendly-snippets/snippets/*",
    -- border for lsp signature popup, :h nvim_open_win
    signature_border = "rounded",
    -- lsp kind formatting, k is kind string "Field", "Struct", "Keyword" etc.
    kind_format = function(k)
      -- return k:lower():sub(1, 1)
      return k
    end,
  }

  vim.opt.completeopt = "menu,menuone,noselect,preview"

  epo.setup(opts)

  ----------
  vim.keymap.set({"i","s"}, "<TAB>", function()
    if vim.fn.pumvisible() == 1 then
      -- return "<C-n>"
      return "<CR>"
    elseif vim.snippet.jumpable(1) then
      return "<cmd>lua vim.snippet.jump(1)<cr>"
    elseif vim.fn.exists("b:_codeium_completions") ~= 0 and vim.fn["codeium#Accept"]() ~= "\t" then
      return vim.fn["codeium#Accept"]()
    else
      return "<TAB>"
    end
  end, { expr = true })

  vim.keymap.set({"i","s"}, "<S-TAB>", function()
    -- if vim.fn.pumvisible() == 1 then
    --   return "<C-p>"
    -- elseif vim.snippet.jumpable(-1) then
    if vim.snippet.jumpable(-1) then
      return "<cmd>lua vim.snippet.jump(-1)<CR>"
    else
      return "<S-TAB>"
    end
  end, { expr = true })

  vim.keymap.set("i", "<C-e>", function()
    if vim.fn.pumvisible() == 1 then
      require("epo").disable_trigger()
    end
    return "<C-e>"
  end, { expr = true })

  vim.keymap.set("i", "<cr>", function()
    if vim.fn.pumvisible() == 1 then
      return "<C-y>"
    end
    return require("nvim-autopairs").autopairs_cr()
  end, { expr = true, noremap = true })
  ----------

  local shl = vim.api.nvim_set_hl
  local ghl = vim.api.nvim_get_hl

  -- Pmenu
  -- PmenuExtra
  -- PmenuSel
  -- PmenuKind
  -- PmenuKindSel
  -- PmenuExtraSel
  -- PmenuSbar
  -- PmenuThumb

  -- local pmenu = ghl(0, { name = "Pmenu" })
  -- local pmenu_sel = ghl(0, { name = "PmenuSel" })
  -- local pmenu_sbar = ghl(0, { name = "PmenuSbar" })
  -- local pmenu_thumb = ghl(0, { name = "PmenuThumb" })

  -- shl(0, "Pmenu", { fg = "#FFFFFF", bg = "#333333", italic = true })
  -- shl(0, "PmenuSel", { fg = "#FFFFFF", bg = "#005f87", bold = true })
  -- shl(0, "PmenuSbar", { fg = "#FFFFFF", bg = "#444444" })
  -- shl(0, "PmenuThumb", { fg = "#FFFFFF", bg = "#666666" })
  -- shl(0, "PmenuExtra", { fg = "#FFFFFF", bg = "#282828" })
  -- shl(0, "PmenuKind", { fg = "#FFFFFF", bg = "#3a3a3a", underline = true })
  -- shl(0, "PmenuKindSel", { fg = "#FFFFFF", bg = "#5f875f", undercurl = true })
  -- shl(0, "PmenuExtraSel", { fg = "#FFFFFF", bg = "#875f87", reverse = true })

  -- vim.api.nvim_create_autocmd("ColorScheme", {
  --   pattern = "*",
  --   callback = function()
  --     shl(0, "Pmenu", { fg = "#FFFFFF", bg = "#333333", italic = true })
  --     shl(0, "PmenuSel", { fg = "#FFFFFF", bg = "#005f87", bold = true })
  --     shl(0, "PmenuSbar", { fg = "#FFFFFF", bg = "#444444" })
  --     shl(0, "PmenuThumb", { fg = "#FFFFFF", bg = "#666666" })
  --     shl(0, "PmenuExtra", { fg = "#FFFFFF", bg = "#282828" })
  --     shl(0, "PmenuKind", { fg = "#FFFFFF", bg = "#3a3a3a", underline = true })
  --     shl(0, "PmenuKindSel", { fg = "#FFFFFF", bg = "#5f875f", undercurl = true })
  --     shl(0, "PmenuExtraSel", { fg = "#FFFFFF", bg = "#875f87", reverse = true })
  --   end,
  -- })
end
