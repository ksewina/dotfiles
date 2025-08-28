-- Core Neovim options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"

-- Scrolling and viewport
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false

-- Colors and appearance
opt.termguicolors = true
opt.background = "dark"

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search behavior
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- File management
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menuone,noselect,noinsert"

-- System integration
opt.clipboard = "unnamedplus"

-- Window splitting
opt.splitright = true
opt.splitbelow = true

-- Create undo directory if it doesn't exist
vim.fn.mkdir(vim.fn.expand("~/.vim/undodir"), "p")