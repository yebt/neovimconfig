-- Plugins to manage the completions
return {
  -- Mini Completions
  -- {
  --   "echasnovski/mini.completion",
  --   version = false,
  --   lazy = false,
  --   REQURE: set iskeyword+=- to load complete word in autompletions
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
  --
  {
    "Exafunction/codeium.vim",
    event = { "VeryLazy", "BufEnter" },
    -- init = function()
    --   vim.g.codeium_disable_bindings = 1
    -- end
    config = function()
      -- Clear current suggestion 	codeium#Clear() 	<C-]>
      -- Next suggestion 	codeium#CycleCompletions(1) 	<M-]>
      -- Previous suggestion 	codeium#CycleCompletions(-1) 	<M-[>
      -- Insert suggestion 	codeium#Accept() 	<Tab>
      -- Manually trigger suggestion 	codeium#Complete() 	<M-Bslash>
      --
      -- Change '<C-g>' here to any keycode you like.
      -- vim.keymap.set("i", "<C-g>", function()
      --   return vim.fn["codeium#Accept"]()
      -- end, { expr = true })
      -- vim.keymap.set("i", "<c-;>", function()
      --   return vim.fn["codeium#CycleCompletions"](1)
      -- end, { expr = true })
      -- vim.keymap.set("i", "<c-,>", function()
      --   return vim.fn["codeium#CycleCompletions"](-1)
      -- end, { expr = true })
      -- vim.keymap.set("i", "<c-x>", function()
      --   return vim.fn["codeium#Clear"]()
      -- end, { expr = true })
    end,
  },
}
