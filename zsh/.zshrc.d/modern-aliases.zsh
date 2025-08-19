#!/usr/bin/env zsh

# Modern CLI tool aliases
# Uses the tools installed via brew-base-install script

# Better ls with eza (if installed)
if command -v eza &> /dev/null; then
    alias ls="eza --icons --git --group-directories-first"
    alias ll="eza --icons --git -l --group-directories-first"
    alias la="eza --icons --git -la --group-directories-first"
    alias tree="eza --tree --icons --git"
fi

# Better cat with bat (if installed)
if command -v bat &> /dev/null; then
    alias cat="bat"
    alias less="bat"
    # Show file with line numbers
    alias catn="bat --style=numbers"
fi

# Better find with fd (if installed)
if command -v fd &> /dev/null; then
    alias find="fd"
fi

# Better grep with ripgrep (if installed)
if command -v rg &> /dev/null; then
    alias grep="rg"
fi

# Better diff with delta (if installed)
if command -v delta &> /dev/null; then
    alias diff="delta"
fi

# Better top with htop (if installed)
if command -v htop &> /dev/null; then
    alias top="htop"
fi

# Development aliases
alias k="kubectl"
alias tf="terraform"
alias lg="lazygit"
alias ld="lazydocker"

# Quick directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

# Git shortcuts (if not using hub)
if ! command -v hub &> /dev/null; then
    alias g="git"
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit"
    alias gp="git push"
    alias gl="git pull"
    alias gd="git diff"
    alias gb="git branch"
    alias gco="git checkout"
fi