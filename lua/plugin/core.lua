-- Here contain not behaviour plugins, libs, and addons
return {
  -- reuse funcions
  { "nvim-lua/plenary.nvim" },
  -- devicons
  {
    "nvim-tree/nvim-web-devicons",
    config = require("plugin.config.nvim-web-devicons"),
  },
  -- Hardtime
  {
    "m4xshen/hardtime.nvim",
    -- lazy = false,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    -- event = "VeryLazy",
    lazy = false,
    config = require("plugin.config.hardtimec"),
  },
}
