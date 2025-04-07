# To avoid duplicates in your $PATH, you can utilize zsh's array features:
# typeset -aU path: This ensures that the path array (which mirrors the $PATH
# environment variable) only contains unique elements.
typeset -aU path # Makes PATH elements unique (zsh only)
path+=($HOME/.local/bin $HOME/scripts)
export PATH

#zmodload zsh/zprof
HISTSIZE=5000
SAVEHIST=${HISTSIZE}
HISTFILE=~/.zsh_history
HISTDUP=erase

#want to see all options available:
#emulate -lLR zsh
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Enable colors
autoload -U colors && colors

#Changing Directories
setopt auto_cd # If command is a directory path, cd to it.
setopt auto_pushd # cd is really pushd.
setopt chase_links # Resolve symbolic links to their true location.
setopt pushd_ignore_dups # Don't put duplicates on the directory stack.
setopt pushd_minus # Make `cd -1` go to the previous directory, etc.
setopt pushd_to_home # pushd with no arguments goes home, like cd.

# Completion
# setopt auto_param_keys # Intelligently add a space after variable completion.
# setopt auto_param_slash # Intelligently add a slash after directory completion.
setopt auto_remove_slash # Remove trailing slash if next char is a word delim.
setopt complete_aliases # Treat aliases as distinct commands.
setopt complete_in_word # Completions happen at the cursor's location.
setopt glob_complete # Tab completion expands globs.
setopt hash_list_all # Ensure the command path is hashed before completion.
setopt menu_complete # Expand first match and use the interactive menu.

# Expansion and Globbing
setopt glob # Enable globbing (i.e. the use of the '*' operator).
setopt extended_glob # Use additional glob operators ('#', '~', and '^').
setopt no_glob_dots # Require a leading '.' to be matched explicitly.
setopt mark_dirs # Mark directories resulting from globs with trailing slashes.
# setopt nomatch # If a glob fails, the command isn't executed.

# History
setopt hist_ignore_all_dups # Ignore all duplicates when writing history.
setopt hist_ignore_space # Ignore commands that begin with spaces.
setopt inc_append_history # Write commands to history file as soon as possible.

# Input/Output
setopt append_create # Allow '>>' to create a file.
setopt no_clobber # Prevent `>` from clobbering files. Use `>!` to clobber.
setopt correct # Offer to correct the spelling of commands.
setopt interactive_comments # Allow comments in interactive shells.
setopt short_loops # Enable short loop syntax: `for <var> in <seq>; <command>`.

# Job Control
setopt auto_continue # When suspended jobs are disowned, resume them in the bg.
setopt auto_resume # Single-word simple commands are candidates for resumption.
setopt bg_nice # Run background jobs at lower priority.
setopt check_jobs # Warn about suspended jobs on exit.
setopt check_running_jobs # Warn about background jobs on exit.

# Scripts and Functions
setopt local_loops # Do not allow `break` etc. outside of loops.

# ZLE
# setopt zle # Use ZLE.
# setopt no_beep # Do not beep on ZLE errors (most beeps).

autoload -Uz compinit
compinit -u

zstyle ':completion:*' use-cache true # Cache completion to `${ZDOTDIR}/.zcompcache`.
zstyle ':completion:*' menu 'select' # Make the menu interactive with arrow keys.

bindkey -v

# Load vcs_info for git branch display
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %F{green}(%b)%f'
zstyle ':vcs_info:*' enable git

# Set up the prompt
setopt PROMPT_SUBST
PROMPT='%F{magenta}%~%f${vcs_info_msg_0_} %F{yellow}%#%f '
RPROMPT='%T'

# Better completion system
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# optional fzf settings
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_CTRL_R_OPTS="--sort --exact"

# Source aliases if file exists
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

#zprof
