local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recoomends from nvim documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- just use defaults
nvimtree.setup()

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")


