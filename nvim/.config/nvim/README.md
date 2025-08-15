# Simple but Feature-Rich Neovim Setup

A clean, modern Neovim configuration using lazy.nvim that focuses on simplicity without sacrificing functionality.

## Features

- **Package Manager**: lazy.nvim (modern, fast, lazy-loading)
- **Colorscheme**: Catppuccin (modern, pleasant)
- **LSP Support**: Full LSP integration with Mason for easy server management
- **File Navigation**: Neo-tree file explorer + Telescope fuzzy finder
- **Tmux Integration**: Seamless navigation between tmux panes and vim splits
- **Language Support**: Optimized for dotfiles, YAML, Go, Python, Lua, and more
- **Auto-completion**: nvim-cmp with LSP, buffer, and path sources
- **Git Integration**: Gitsigns for git status in the gutter
- **Quality of Life**: Auto-pairs, commenting, surround, indent guides

## Key Bindings

### Basic
- `<Space>` - Leader key
- `jk` - Exit insert mode
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>x` - Close buffer
- `<Tab>` / `<S-Tab>` - Next/previous buffer

### File Navigation
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files
- `<leader>fc` - Find word under cursor

### Tmux Integration
- `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` - Navigate between vim splits and tmux panes

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>rn` - Rename
- `<leader>ca` - Code actions
- `<leader>f` - Format code

### Window Management
- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<leader>se` - Equal splits
- `<leader>sx` - Close split

### Git
- `<leader>gp` - Preview hunk
- `<leader>gt` - Toggle line blame

## Language Support

### YAML
- Full LSP support with yamlls
- Schema validation for:
  - GitHub Actions workflows
  - Docker Compose files
  - Kustomization files
  - Ansible playbooks

### Go
- gopls LSP server with advanced features
- Auto-formatting with gofumpt
- Static analysis with staticcheck

### Others
- Lua (vim configuration)
- Python (pyright)
- Bash scripting
- JSON
- Markdown

## Installation

1. Remove old nvim config: `rm -rf ~/.config/nvim ~/.local/share/nvim`
2. Use stow to deploy: `stow nvim`
3. Start nvim - lazy.nvim will auto-install and configure everything
4. Run `:checkhealth` to verify everything is working

## Auto-formatting

Files are automatically formatted on save for:
- Lua files
- Go files
- Python files
- YAML files
- JSON files