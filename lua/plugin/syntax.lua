-- syntax
return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
      -- tags
      {
        "windwp/nvim-ts-autotag",
      },
    },
    config = require("plugin.config.treesitter"),
  },

  -- rainbow

  -- Match
  -- {
  --   "andymass/vim-matchup",
  --   event = "VeryLazy",
  --   init = function()
  --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --     -- vim.g.matchup_matchparen_stopline = 400
  --     vim.g.matchup_matchparen_deferred = 1
  --     vim.g.matchup_transmute_enabled = 1
  --   end,
  -- },

  -- Context Comment String
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    opts = {
      -- enable_autocmd = false,
    },
  },
}
