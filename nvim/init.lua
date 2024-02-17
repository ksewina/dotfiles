-- init.lua will be autoloaded for neovim https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- mappings
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})

vim.g.mapleader = " "

-- local keymap = vim.keymap

-- lazy package manager


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


local opts = {}

require("options")
require("lazy").setup("plugins")

vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>')


