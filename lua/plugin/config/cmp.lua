return function()
  local cmp = require("cmp")
  local types = require("cmp.types")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  local luasnip = require("luasnip")

  cmp.setup({
    performance = {
      debounce = 60,
      throttle = 30,
      fetching_timeout = 500,
      confirm_resolve_timeout = 80,
      async_budget = 1,
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
      completeopt = 'menu,menuone,noselect',
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
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
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
