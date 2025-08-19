# dotfiles

Modern dotfiles setup for macOS and Linux using [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start

```bash
# Clone and setup
git clone https://github.com/ksewina/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install applications (macOS)
./scripts/brew-base-install

# Install dotfiles with stow
stow gitconfig tmux zsh  # etc.
```

## Structure

- `scripts/` - Installation and setup scripts
- `zsh/` - Shell configuration with extensive keyboard handling
- `tmux/` - Terminal multiplexer with vim integration
- `gitconfig/` - Modern git configuration based on core dev practices
- `starship/` - Cross-shell prompt with gruvbox theme
- `k9s/` - Kubernetes CLI with catppuccin themes
- `alacritty/` - GPU-accelerated terminal with dracula theme
- `aliases/` - Core shell aliases and extensive kubernetes workflow
- `bat/` - Better cat with syntax highlighting (gruvbox theme)
- `ripgrep/` - Better grep configuration

## Aliases System

This dotfiles uses a two-tier alias system:

1. **Core aliases** (`aliases/.aliases`) - Always active, essential shortcuts
2. **Modern CLI aliases** (`zsh/.zshrc.d/modern-aliases.zsh`) - Conditional fallbacks to modern tools

The modern aliases only activate if the replacement tools are installed (via `brew-base-install`):
- `ls` → `eza` (better ls with icons)  
- `cat` → `bat` (syntax highlighting)
- `find` → `fd` (faster find)
- `grep` → `rg` (ripgrep)
- `diff` → `delta` (better git diff)

If these tools aren't installed, the system falls back to standard commands seamlessly.
