-- All lsp contributions
return {
  -- lspconfi 
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    -- event = "VeryLazy",
    config = require("plugin.config.lsp")
  }
}
