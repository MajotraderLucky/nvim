local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if vim.loop and vim.loop.fs_stat and not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("config.plugins")

