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
