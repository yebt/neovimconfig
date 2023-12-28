return function()
  local cmp = require("cmp")
  local types = require("cmp.types")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  local luasnip = require("luasnip")

  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  cmp.setup({
    performance = {
      debounce = 60,
      throttle = 30,
      fetching_timeout = 500,
      confirm_resolve_timeout = 80,
      async_budget = 4,
      max_view_entries = 200,
    },

    preselect = types.cmp.PreselectMode.Item,

    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      -- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm(), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- if #cmp.get_entries() == 1 then
          --   cmp.confirm({ select = true })
          -- else
          --   cmp.select_next_item()
          -- end

            cmp.confirm({ select = true })
        --[[ Replace with your snippet engine (see above sections on this page)
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance() ]]
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        -- elseif has_words_before() then
        --   cmp.complete()
        --   if #cmp.get_entries() == 1 then
        --     cmp.confirm({ select = true })
        --   end
        --   -
        elseif vim.fn.exists("b:_codeium_completions") ~= 0 and vim.fn["codeium#Accept"]() ~= "\t" then
          -- vim.cmd("silen normal! " .. vim.fn["codeium#Accept"]())
          -- vim.api.nvim_exec2("silent normal " .. vim.fn["codeium#Accept"](), { output = false })
          -- vim.fn.feedkeys(vim.fn["codeium#Accept"]())
          vim.fn.feedkeys("")
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    completion = {
      autocomplete = {
        types.cmp.TriggerEvent.TextChanged,
      },
      completeopt = "menu,menuone,preview,noselect,noinsert",
      keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      keyword_length = 1,
    },

    formatting = {
      expandable_indicator = true,
      fields = { "abbr", "kind", "menu" },
      format = function(_, vim_item)
        return vim_item
      end,
    },
    matching = {
      disallow_fuzzy_matching = false,
      disallow_fullfuzzy_matching = false,
      disallow_partial_fuzzy_matching = true,
      disallow_partial_matching = false,
      disallow_prefix_unmatching = false,
    },

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- For luasnip users.
      { name = "emmet" },
    }, {
      { name = "buffer" },
    }),

    confirmation = {
      default_behavior = types.cmp.ConfirmBehavior.Insert,
      get_commit_characters = function(commit_characters)
        return commit_characters
      end,
    },

    experimental = {
      ghost_text = false,
    },

    view = {
      entries = {
        name = "custom",
        selection_order = "top_down",
      },
      docs = {
        auto_open = true,
      },
    },
  })
  --
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
