-- Add behaviours to neovim, this behaviour is not trigger 
return {

  -- Automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
  {
    "tpope/vim-sleuth",
    lazy = false,
  },

  -- Starter
  {
    'echasnovski/mini.starter',
    version = false,
    config = require("plugin.config.mini_starter")
  },

  -- which key
  {
    'echasnovski/mini.clue',
    version = false,
    lazy=false,
    config = require("plugin.config.mini_clue")
  },

}
