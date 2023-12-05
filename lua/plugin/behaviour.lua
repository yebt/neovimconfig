-- Add behaviours to neovim, this behaviour is not trigger
return {

  -- Automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
  {
    "tpope/vim-sleuth",
    lazy = false,
  },

  -- mini sessions
  {
    "echasnovski/mini.sessions",
    version = false,
    lazy = false,
    event = "VeryLazy",
    init = function()
      -- Make autosave session
      vim.api.nvim_create_autocmd("VimLeavePre", {
        group = vim.api.nvim_create_augroup("_mini_session_persistence", { clear = true }),
        callback = function()
          local buffers = vim.fn.getbufinfo({ buflisted = 1 })
          local cntrs = #buffers

          for _, buffer in ipairs(buffers) do
            if buffer.name == "" then
              cntrs = cntrs - 1
            end
          end

          if cntrs ~= 0 then
            local cwd = vim.fn.getcwd()
            local basename = cwd:match("[^/]+$")
            local path = cwd:gsub("/", "%%")
            local session_name = basename .. " (" .. path .. ")"
            local session_opts = {verbose = {write = false}}
            if MiniSessions then
              MiniSessions.write(session_name,session_opts)
              MiniSessions.write("latest",{verbose = false}) -- save the latest work
            end
          end
        end,
      })
    end,
    config = require("plugin.config.mini_sessions"),
    keys = {
      -- {
      --   "<leader>ST",
      --   function()
      --     vim.notify(vim.inspect(MiniSessions.detected))
      --   end,
      -- },
      {
        "<leader>SS",
        function()
          MiniSessions.select()
        end,
        desc = "Select a session",
      },
      {
        "<leader>SM",
        function()
          -- local session_name = ('%s%ssession'):format(vim.fn.stdpath('data'), '_')
          local cwd = vim.fn.getcwd()
          local basename = cwd:match("[^/]+$")
          local path = cwd:gsub("/", "%%")
          -- local session_name = vim.fn.getcwd():gsub(pattern, "%%")
          -- local session_name = basename .. " (" .. cwd .. ")"
          local session_name = basename .. " (" .. path .. ")"
          -- vim.notify(vim.inspect(session_name))
          MiniSessions.write(session_name)
        end,
        desc = "Make session",
      },
      {
        "<leader>SL",
        function()
          MiniSessions.read("latest")
        end,
        desc = "Read 'latest' session",
      },
    }, 
  },

  -- -- Persistence sessions
  -- {
  --   "folke/persistence.nvim",
  --   event = "BufReadPre", -- this will only start session saving when an actual file was opened
  --   -- lazy = false,
  --   opts = {
  --     -- add any custom options here
  --     -- dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
  --     -- dir = vim.fn.expand(vim.fn.stdpath("state") .. "/nvim_session/"), -- directory where session files are saved
  --     -- dir = ('%s%ssession'):format(vim.fn.stdpath('data'), '_') .. "/", -- directory where session files are saved
  --     options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
  --     pre_save = nil, -- a function to call before saving the session
  --     save_empty = false, -- don't save if there are no open file buffers
  --   }
  -- },

  -- Starter
  {
    "echasnovski/mini.starter",
    version = false,
    config = require("plugin.config.mini_starter"),
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
    event = "VeryLazy",
    config = require("plugin.config.wich_key"),
  },
}
