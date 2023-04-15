-- leader is space
vim.g.mapleader = " "

local keymap = vim.keymap

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

