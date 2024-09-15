local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {{ import = "plugins" }},
  install = { colorscheme = { "catpuccin-mocha" } },
  checker = { enabled = true },
  change_detection = { notify = false },
})
