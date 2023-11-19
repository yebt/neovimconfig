-- Here contain not behaviour plugins, libs, and addons
return {
  -- reuse funcions
  { "nvim-lua/plenary.nvim" },
  -- devicons
  {
    "nvim-tree/nvim-web-devicons",
    config = require("plugin.config.nvim-web-devicons"),
  },
}
