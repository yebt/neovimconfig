-- Plugins to manage the completions
return {
  -- Mini Completions
  {
    "echasnovski/mini.completion",
    version = false,
    lazy=false,
    event = "InsertEnter",
    config = require("plugin.config.mini_completion"),
  },

  -- COQ
  -- {
  --   "ms-jpq/coq_nvim",
  --   event = "InsertEnter",
  --   config = require("plugin.config.coc_nvim")
  -- },
}
