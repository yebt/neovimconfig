-- All lsp contributions
return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    -- lazy = false,
    -- event = "VeryLazy",
    -- config = require("plugin.config.lsp"),
  },
  
  -- NULL
  {
    "nvimtools/none-ls.nvim",
  },

  -- MSON
  {
    "williamboman/mason.nvim",
    -- lazy = false,
    event = {"VeryLazy"},
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = require("plugin.config.mason"),
  },

  -- SLPSAGA

  -- Notifications
  {
    "j-hui/fidget.nvim",
    -- event = { "LspAttach" },
    -- lazy = false,
    -- event = { "VimEnter","LspAttach" },
    config = require("plugin.config.fidget"),
  },
  -- {
  --   "vigoux/notifier.nvim",
  --   lazy = false,
  --   opts = {
  --     ignore_messages = {}, -- Ignore message from LSP servers with this name
  --     -- status_width = something, -- COmputed using 'columns' and 'textwidth'
  --     components = { -- Order of the components to draw from top to bottom (first nvim notifications, then lsp)
  --       "nvim", -- Nvim notifications (vim.notify and such)
  --       "lsp", -- LSP status updates
  --     },
  --     notify = {
  --       clear_time = 5000, -- Time in milliseconds before removing a vim.notify notification, 0 to make them sticky
  --       min_level = vim.log.levels.INFO, -- Minimum log level to print the notification
  --     },
  --     component_name_recall = false, -- Whether to prefix the title of the notification by the component name
  --     zindex = 50, -- The zindex to use for the floating window. Note that changing this value may cause visual bugs with other windows overlapping the notifier window.
  --   },
  -- },
}
