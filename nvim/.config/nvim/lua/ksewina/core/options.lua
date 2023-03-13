local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- rel number to positon
opt.number = true -- abs number shows on cursor line

-- tabs and indent
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- indent depth 
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- no line wrap

-- search settings
opt.ignorecase = true -- case insensitive
opt.smartcase = true -- if typing mixed case, make case-sensitivity matter

-- cursor line
opt.cursorline = true

-- appearance 

-- this requires true color terminals
opt.termguicolors = true
opt.background = "dark" --testing
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- superpower

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard (pbpaste can work as well here)

-- splitwindow
opt.splitright = true
opt.splitbelow = true

-- others

opt.iskeyword:append("-") -- dashes combine words to one

