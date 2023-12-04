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

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
      {
        "<leader>T<space>",
        ":Telescope<CR>",
        desc = "Open telescope",
      },
      {
        "<C-p>",
        function()
          require("telescope.builtin").find_files({
            prompt_prefix = " ",
            prompt_title = "",
            -- selection_caret = "* ",
            multi_icon = "- ",
            attach_mappings = function(_, map)
              map("i", "<ESC>", require("telescope.actions").close)
              return true
            end,
            results_title = false,
            sorting_strategy = "ascending",
            layout_strategy = "center",
            layout_config = {
              -- preview_cutoff = 1, -- Preview should always show (unless previewer = false)
              -- preview_cutoff = 0, -- Preview should always show (unless previewer = false)
              -- width = 0.5,
              width = 70,
              -- height = 12,
              -- preview_cutoff = 120,
              anchor = "N",
            },
            -- -- border = false,
            border = true,
            borderchars = {
              prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
              results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
              preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },

          })
        end,
        silent = true,
        desc = "Telescope fast ff",
      },
    },
  },

  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = {
      line_sep_start = "┌────────────────────────────────────────",
      result_padding = "│  ",
      line_sep = "└─────────────────────────────────────────",
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
