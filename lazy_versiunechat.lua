--cand m-am lovit de porblema cu treesitter si cu erorile din cazua ca "folosea old master branch" 
--chat gpt m-a pus sa schimnb si asta
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("dani.plugins", {
  { import = "dani.core.plugins" },  -- loads everything from lua/dani/core/plugins/*.lua
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
