-- this contain the colorschemes to download
return {
  --
  {
    "oxfist/night-owl.nvim",
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd.colorscheme("night-owl")
    -- end
  },
  --
  {
    "zootedb0t/citruszest.nvim",
    -- init = function()
    --   vim.g.walo_colorscheme_plugin = "citruszest.nvim"
    --   vim.g.walo_colorscheme_name = "citruszest"
    -- end
  },
  --
  {
    "sainnhe/gruvbox-material",
    init = function()
      -- vim.g.walo_colorscheme_plugin = "gruvbox-material"
      -- vim.g.walo_colorscheme_name = "gruvbox-material"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "original" --  `'material'`, `'mix'`, `'original'`
      vim.g.gruvbox_material_enable_bold = 1 -- 0 1
      vim.g.gruvbox_material_enable_italic = 1 -- 0 1
      vim.g.gruvbox_material_visual = "reverse" -- `'grey background'`, `'green background'`, `'blue background'`, `'red background'`, `'reverse'`

      vim.g.gruvbox_material_spell_foreground = "colored" -- none'`, `'colored'`
      vim.g.gruvbox_material_diagnostic_text_highlight = 1 -- 0 1

      vim.g.gruvbox_material_ui_contrast = "low" -- The contrast of line numbers, indent lines, etc.
      vim.g.gruvbox_material_float_style = "bright" -- Background of floating windows -- `'bright'`, `'dim'`
      vim.g.gruvbox_material_statusline_style = "material"

      -- if (vim.o.background == 'light') then
      --   vim.g.gruvbox_material_colors_override = { bg0 = '#f9f5d7' }
      -- else
      --   vim.g.gruvbox_material_colors_override = { bg0 = '#0e1010' }
      -- end

      vim.g.gruvbox_material_colors_override = { bg0 = "#0e1010" } -- #0e1010
      vim.g.gruvbox_material_better_performance = 1
    end,
  },
  --
  {
    "navarasu/onedark.nvim",
    -- init = function()
    --   vim.g.walo_colorscheme_plugin = "onedark.nvim"
    --   vim.g.walo_colorscheme_name = "onedark"
    -- end,
    opts = {
      style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = false, -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      -- Lualine options --
      lualine = {
        transparent = false, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {}, -- Override default colors
      highlights = {}, -- Override highlight groups

      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
  },
  --
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- init = function()
    --   vim.g.walo_colorscheme_plugin = "oxocarbon.nvim"
    --   vim.g.walo_colorscheme_name = "oxocarbon"
    -- end,
  },
  --
  {
    "folke/tokyonight.nvim",
    -- init = function()
    --   vim.g.walo_colorscheme_plugin = "tokyonight.nvim"
    --   vim.g.walo_colorscheme_name = "tokyonight-night"
    -- end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    init = function()
      vim.g.walo_colorscheme_plugin = "solarized-osaka.nvim"
      vim.g.walo_colorscheme_name = "solarized-osaka"
    end
  }
}
