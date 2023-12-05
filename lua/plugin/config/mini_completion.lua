return function()
  -- local opts = {}
  local opts = {
    delay = { completion = 50, info = 100, signature = 50 },
    window = {
      info = { height = 25, width = 80, border = "shadow" },
      signature = { height = 25, width = 80, border = "rounded" },
    },
  }
  --local opts = {
  --  -- Delay (debounce type, in ms) between certain Neovim event and action.
  --  -- This can be used to (virtually) disable certain automatic actions by
  --  -- setting very high delay time (like 10^7).
  --  delay = { completion = 100, info = 100, signature = 50 },

  --  -- Configuration for action windows:
  --  -- - `height` and `width` are maximum dimensions.
  --  -- - `border` defines border (as in `nvim_open_win()`).
  --  window = {
  --    info = { height = 25, width = 80, border = "none" },
  --    signature = { height = 25, width = 80, border = "none" },
  --  },

  --  -- Way of how module does LSP completion
  --  -- lsp_completion = {source_func = 'omnifunc', auto_setup = false},
  --  -- Way of how module does LSP completion
  --  lsp_completion = {
  --    -- `source_func` should be one of 'completefunc' or 'omnifunc'.
  --    source_func = "completefunc",

  --    -- `auto_setup` should be boolean indicating if LSP completion is set up
  --    -- on every `BufEnter` event.
  --    auto_setup = true,

  --    -- `process_items` should be a function which takes LSP
  --    -- 'textDocument/completion' response items and word to complete. Its
  --    -- output should be a table of the same nature as input items. The most
  --    -- common use-cases are custom filtering and sorting. You can use
  --    -- default `process_items` as `MiniCompletion.default_process_items()`.
  --    --minidoc_replace_start process_items = --<function: filters out snippets; sorts by LSP specs>,
  --    process_items = function(items, base)
  --      local res = vim.tbl_filter(function(item)
  --        -- Keep items which match the base and are not snippets
  --        return vim.startswith(H.get_completion_word(item), base) and item.kind ~= 15
  --      end, items)

  --      table.sort(res, function(a, b)
  --        return (a.sortText or a.label) < (b.sortText or b.label)
  --      end)

  --      return res
  --    end,
  --    --minidoc_replace_end
  --  },
  --    fallback_action = function() vim.api.nvim_feedkeys(H.keys.ctrl_n, 'n', false) end,

  --  -- lsp_completion = {
  --  --   -- `source_func` should be one of 'completefunc' or 'omnifunc'.
  --  --   -- source_func = "completefunc",
  --  --   source_func = "omnifunc",

  --  --   -- `auto_setup` should be boolean indicating if LSP completion is set up
  --  --   -- on every `BufEnter` event.
  --  --   auto_setup = true,

  --  --   -- `process_items` should be a function which takes LSP
  --  --   -- 'textDocument/completion' response items and word to complete. Its
  --  --   -- output should be a table of the same nature as input items. The most
  --  --   -- common use-cases are custom filtering and sorting. You can use
  --  --   -- default `process_items` as `MiniCompletion.default_process_items()`.
  --  --   -- process_items = --<function: filters out snippets; sorts by LSP specs>,
  --  -- },

  --  -- Fallback action. It will always be run in Insert mode. To use Neovim's
  --  -- built-in completion (see `:h ins-completion`), supply its mapping as
  --  -- string. Example: to use 'whole lines' completion, supply '<C-x><C-l>'.
  --  -- fallback_action = --<function: like `<C-n>` completion>,

  --  -- Module mappings. Use `''` (empty string) to disable one. Some of them
  --  -- might conflict with system mappings.
  --  mappings = {
  --    force_twostep = "<C-Space>", -- Force two-step completion
  --    force_fallback = "<A-Space>", -- Force fallback completion
  --  },

  --  -- Whether to set Vim's settings for better experience (modifies
  --  -- `shortmess` and `completeopt`)
  --  set_vim_settings = true,
  --}

  require("mini.completion").setup(opts)
end
