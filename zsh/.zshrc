# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
POWERLEVEL9K_INSTANT_PROMPT="quiet"

# Function to add multiple paths to PATH
path_add() {
    for dir in "$@"; do
        if [[ -d "$dir" ]] && [[ ":$PATH:" != *":$dir:"* ]]; then
            export PATH="$dir:$PATH"
            #echo "Added $dir to PATH"
        fi
    done
}

# Usage examples:
# Add a single path
#path_add "$HOME/go/bin"


# Add multiple paths at once
path_add "$HOME/.local/bin" "$HOME/go/bin" "$HOME/.krew/bin" "/nix/var/nix/profiles/default/bin"
# enabled:
# - lunarvim
# - go
# - krew (kubectl plugin manager)



#xmodmap -e "keycode 66 = Escape"
#OMZ plugins
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ansible fzf colored-man-pages kubectl docker terraform helm alias-finder fluxcd)

source $ZSH/oh-my-zsh.sh

# source alias file in $HOME
source $HOME/.aliases

#better manually set this
export LANG=en_US.UTF-8
export VISUAL=nvim
export PAGER=less
export BROWSER=firefox

#XDG Variables https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
#this is respected by a lot of apps linux/macOS
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#enable direnv function (load vars in specific project folders and stuff)
eval "$(direnv hook zsh)"
