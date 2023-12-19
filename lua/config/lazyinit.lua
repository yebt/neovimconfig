local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  vim.notify("lazy nvim cloned")
end
--
vim.opt.rtp:prepend(lazypath)
--
require("lazy").setup({
  defaults = {
    lazy = true, -- should plugins be lazy-loaded?
    version = nil,
    -- default `cond` you can use to globally disable a lot of plugins
    -- when running inside vscode for example
    cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
    -- version = "*", -- enable this to try installing the latest stable versions of plugins
  },
  -- spec = "plugin",
  spec = {
    {
      "supertab",
      dir ="spt",
      -- opts ={},
      config = true,
      -- lazy = false,
      event={"VeryLazy"},
      dev = true
    },
    {import = "plugin"}
  },
  dev = {
    path = vim.fn.stdpath("config") .. "/lua/local_plugins",
    patterns = {}, -- For example {"folke"}
    fallback = false, -- Fallback to git when local plugin doesn't exist
  },
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = false, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
    check_pinned = false, -- check for pinned packages that can't be updated
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = true, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "gzip",
        "man",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        -- "tohtml",
        "tutor",
        "zipPlugin",

        -- "editorconfig",
        -- "rplugin",
        "shada",
      },
    },
  },
})
