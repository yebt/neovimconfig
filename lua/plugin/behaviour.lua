-- Add behaviours to neovim, this behaviour is not trigger 
return {

  -- Automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
  {
    "tpope/vim-sleuth",
    lazy = false,
  },

  -- mini sessions
  {
    'echasnovski/mini.sessions',
    version = false,
    lazy = false,
    -- event = "VeryLazy",
    config = require("plugin.config.mini_sessions"),
    keys = {
      {"<leader>SS", function() 
        MiniSessions.select()
      end , desc= "Select a session"},
      {"<leader>SM", function()
        if #MiniSessions.detected == 0 then
          -- local session_name = ('%s%ssession'):format(vim.fn.stdpath('data'), '_')
          local pattern = "/"
          local session_name = vim.fn.getcwd():gsub(pattern, "%%")
          -- vim.notify(vim.inspect(#MiniSessions.detected))
          MiniSessions.write(session_name )
        end
      end, desc = "Make session" }
    }
  },

  -- Persistence sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    -- lazy = false,
    opts = {
      -- add any custom options here
      -- dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
      -- dir = vim.fn.expand(vim.fn.stdpath("state") .. "/nvim_session/"), -- directory where session files are saved
      dir = ('%s%ssession'):format(vim.fn.stdpath('data'), '_') .. "/", -- directory where session files are saved
      options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
      pre_save = nil, -- a function to call before saving the session
      save_empty = false, -- don't save if there are no open file buffers
    }
  },

  -- Starter
  {
    'echasnovski/mini.starter',
    version = false,
    config = require("plugin.config.mini_starter")
  },

  -- which key
  -- {
  --   'echasnovski/mini.clue',
  --   version = false,
  --   lazy=false,
  --   config = require("plugin.config.mini_clue")
  -- },
  {
    "folke/which-key.nvim",
    -- lazy = false,
    event="VeryLazy",
    config = require("plugin.config.wich_key"),
  },



}
