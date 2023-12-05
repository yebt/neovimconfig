return function()
  local lspconfig = require("lspconfig")
  local mason = require("mason")
  local masonlsp = require("mason-lspconfig")
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  masonlsp.setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
    automatic_installation = false,
    handlers = {},
  })
  masonlsp.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup({})
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function()
    --   require("rust-tools").setup({})
    -- end,
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
        -- on_init = function(client)
        --   local path = client.workspace_folders[1].name
        --   if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
        --     client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        --       Lua = {
        --         runtime = {
        --           -- Tell the language server which version of Lua you're using
        --           -- (most likely LuaJIT in the case of Neovim)
        --           version = 'LuaJIT'
        --         },
        --         -- Make the server aware of Neovim runtime files
        --         workspace = {
        --           checkThirdParty = true,
        --           -- library = {
        --             --   vim.env.VIMRUNTIME
        --             --   -- "${3rd}/luv/library"
        --             --   -- "${3rd}/busted/library",
        --             -- },
        --             -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        --             library = vim.api.nvim_get_runtime_file("", true)
        --           }
        --         }
        --       })

        --       client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        --     end
        --     return true
        --   end
      })
    end,
    ["pyright"] = function()
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              autoImportCompletions = true,
              autoSearchPaths = true,
              diagnosticMode = {"openFilesOnly", "workspace"},
              useLibraryCodeForTypes = true,
            },
          },
        },
      })
    end,
  })
end
