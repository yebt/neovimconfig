-- The UI plugins to improve the ui experience
return {

  -- Better simple ui 
  {
    "stevearc/dressing.nvim",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
    config = require("plugin.config.dressing")
  },

  -- Mini indent scope
  -- {
  --   "echasnovski/mini.indentscope",
  --   event = "VeryLazy",
  --   config = require("plugin.config.mini_indentscope")
  -- },

  -- Indent blank line
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event="VeryLazy",
    config = require("plugin.config.indent_blankline")
  }
}
