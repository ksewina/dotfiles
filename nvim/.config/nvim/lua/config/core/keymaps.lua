-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Disable Space in normal and visual mode (since it's leader)
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- General keymaps
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- File operations
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equal splits" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Buffer management
keymap("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Advanced keymaps (commented out for simplicity)
-- Uncomment these as you get more comfortable:

-- -- Clear search highlights
-- keymap("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- -- Increment/decrement numbers
-- keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
-- keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- -- Move text up and down in visual mode
-- keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
-- keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- -- Better paste (don't lose yanked text when pasting over selection)
-- keymap("x", "<leader>p", [["_dP]], { desc = "Paste without losing yank" })

-- -- Copy to system clipboard
-- keymap({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })

-- -- Delete to void register (don't affect clipboard)
-- keymap({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete to void register" })