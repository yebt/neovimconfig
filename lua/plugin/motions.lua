-- This contian the motions and searchers
return {

  -- fzf-lua
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "junegunn/fzf",
      build = "./install --bin",
    },
    cmd = {
      "FzfLua",
    },
  },

  -- fzf vim
  -- {
  --   "junegunn/fzf.vim",
  --   dependencies = {
  --      "junegunn/fzf", build = "./install --bin"
  --   },
  --   cmd = {
  --     "Files"
  --   }
  -- }

  -- Flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      {"f"},
      {"F"},
      {"t"},
      {"T"},
      {";"},
      {","},
    },
    config = require("plugin.config.flash_nvim"),
  },
}
