-- Plugins to manage the completions
return {
  -- Mini Completions
  -- {
  --   "echasnovski/mini.completion",
  --   version = false,
  --   lazy = false,
  --   -- REQURE: set iskeyword+=- to load complete word in autompletions
  --   event = "InsertEnter",
  --   config = require("plugin.config.mini_completion"),
  -- },

  -- COQ
  -- {
  --   "ms-jpq/coq_nvim",
  --   event = "InsertEnter",
  --   config = require("plugin.config.coc_nvim")
  -- },

  -- nvim cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      --
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      -- "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
        dependencies = {
          "rafamadriz/friendly-snippets"
        },
        config = require("plugin.config.luasnip"),
      },
      "saadparwaiz1/cmp_luasnip"
    },
    event = "InsertEnter",
    config = require("plugin.config.cmp"),
  },

  -- AI Codeium
  {
    "Exafunction/codeium.vim",
    -- event = { "VeryLazy", "BufEnter" },
    event = { "InsertEnter" },
    init = function()
      vim.g.codeium_disable_bindings = 1
    end,
    keys = {
      {
        "<C-]>",
        function()
          vim.fn["codeium#Clear"]()
        end,
        mode = "i",
      },
      {
        "<M-,>",
        function()
          vim.fn["codeium#CycleCompletions"](-1)
        end,
        mode = "i",
      },
      {
        "<M-.>",
        function()
          vim.fn["codeium#CycleCompletions"](1)
        end,
        mode = "i",
      },
      {
        "<M-Bslash>",
        function()
          vim.fn["codeium#CycleCompletions"](1)
        end,
        mode = "i",
      },
    },
    config = function()
      if SpSuscribeFn and type(SpSuscribeFn) == "function" then
        SpSuscribeFn(function()
          return vim.fn["codeium#Accept"]()
        end, function()
          return vim.fn.exists("b:_codeium_completions") ~= 0
        end, true)
      end

      --  (ctrl + shift + } )
      -- Clear current suggestion 	codeium#Clear() 	<C-]>
      -- Next suggestion 	codeium#CycleCompletions(1) 	<M-]>
      -- Previous suggestion 	codeium#CycleCompletions(-1) 	<M-[>
      -- Insert suggestion 	codeium#Accept() 	<Tab>
      -- Manually trigger suggestion 	codeium#Complete() 	<M-Bslash>
    end,
  },
}
