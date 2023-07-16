-- leader is space
vim.g.mapleader = " "

local keymap = vim.keymap

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever
--
keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to buffer
keymap.set("n", "<leader>Y", [["+Y]]) -- copy to systemclipboard
keymap.set({"n", "v"}, "<leader>d", [["_d]])

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- half page scrolling, but keep aligned to center

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

--less confusing when jumping, centers view on match
--
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
