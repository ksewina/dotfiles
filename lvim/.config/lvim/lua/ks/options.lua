local opt = vim.opt -- for conciseness

opt.autowrite = true

-- line numbers

opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2 -- amount of characters are used to indent with >> <<
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping

opt.wrap = false -- disable line wrapping

-- true color terminal

opt.termguicolors = true
-- opt.t_Co=256 for ubuntu terminal


