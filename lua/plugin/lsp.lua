-- All lsp contributions
return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    -- event = "VeryLazy",
    config = require("plugin.config.lsp")
  },

  -- MSON
  {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = require("plugin.config.mason")
  },
  -- NULL
  {
    "nvimtools/none-ls.nvim"
  },
  -- SLPSAGA
}
