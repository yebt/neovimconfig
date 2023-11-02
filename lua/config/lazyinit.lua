local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://githun.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)
