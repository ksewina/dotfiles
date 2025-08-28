-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy with plugins
require("lazy").setup({
  -- Import plugin configurations
  { import = "config.plugins.alpha" },
  { import = "config.plugins.colorscheme" },
  { import = "config.plugins.neo-tree" },
  { import = "config.plugins.telescope" },
  { import = "config.plugins.treesitter" },
  { import = "config.plugins.lsp" },
  { import = "config.plugins.gitsigns" },
  { import = "config.plugins.lualine" },
  { import = "config.plugins.ui" },
  { import = "config.plugins.tmux" },
}, {
  -- Lazy configuration
  checker = {
    enabled = true, -- Check for plugin updates
    notify = false, -- Don't notify about updates
  },
  change_detection = {
    notify = false, -- Don't notify about config changes
  },
})