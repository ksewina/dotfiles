-- Basics
-- comments ai generated
vim.g.mapleader = " " -- Use space as leader key
vim.g.maplocalleader = " "

-- Options
local opt = vim.opt

-- Line numbers and display
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Show absolute line number on cursor line
opt.cursorline = true -- Highlight the current cursor line
opt.signcolumn = "yes" -- Always show sign column
opt.scrolloff = 8 -- Keep 8 lines visible when scrolling
opt.wrap = false -- Disable line wrapping
opt.termguicolors = true -- True color support

-- Tabs and indentation
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.softtabstop = 2 -- Number of spaces inserted for a tab
opt.shiftwidth = 2 -- Size of indent
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true -- Auto indent new lines

-- Search
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override ignorecase if search has uppercase
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Show incremental matches

-- Files
opt.swapfile = false -- No swap file
opt.backup = false -- No backup files
opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
opt.undofile = true -- Enable persistent undo
opt.autowrite = true -- Auto save before commands like :next and :make

-- Behavior
opt.iskeyword:append("-") -- Consider string-string as whole word

-- Visuals
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Ensure plugin directories exist
local data_dir = vim.fn.stdpath("data")
local packer_dir = data_dir .. "/site/pack/packer/start/packer.nvim"

-- Auto-install packer if not exists
if vim.fn.empty(vim.fn.glob(packer_dir)) > 0 then
  vim.fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim", packer_dir
  })
  vim.cmd([[packadd packer.nvim]])
end

-- Plugin Setup
require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'
  
  -- Colorschemes
  use 'folke/tokyonight.nvim'
  
  -- Tmux Navigator
  use {
    'christoomey/vim-tmux-navigator',
    config = function()
      vim.g.tmux_navigator_save_on_switch = 2 -- Save on tmux/vim split switch
      vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<cr>', { silent = true })
      vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<cr>', { silent = true })
      vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<cr>', { silent = true })
      vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<cr>', { silent = true })
    end
  }
  
  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  
  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'ray-x/lsp_signature.nvim',
  }
  
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  
  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }
  
  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
end)

-- Colorscheme
vim.cmd([[colorscheme tokyonight]])

-- Key mappings
-- Escape insert mode with jk
vim.keymap.set('i', 'jk', '<ESC>', { silent = true })

-- Better window navigation
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

-- Clear search highlights
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { silent = true })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true })

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Help tags' })

-- NvimTree
require('nvim-tree').setup()
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })

-- Treesitter setup
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "vim", "javascript", "typescript", "python" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- LSP setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" },
  automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP key bindings
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format code' })

-- LSP server configurations
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  capabilities = capabilities,
}

-- LSP signature setup
require('lsp_signature').setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

-- Completion setup
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  })
})

-- Lualine setup
require('lualine').setup {
  options = {
    theme = 'tokyonight',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  }
}

-- Format on save
vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
  augroup END
]]

-- Create directory for undo files if it doesn't exist
vim.fn.mkdir(vim.fn.expand("~/.vim/undodir"), "p")

-- Return to last edit position when opening files
vim.cmd [[
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
]]