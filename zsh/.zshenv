#  .zshenv
#
#  initial setup file for both interactive and noninteractive zsh
#
#  Read config sequence (except /etc/*)
#
#   login shell
#     $ZDOTDIR/.zshenv
#     $ZDOTDIR/.zprofile
#     $ZDOTDIR/.zshrc
#     $ZDOTDIRA/.zlogin
#
#   interactive zsh
#     $ZDOTDIR/.zshenv
#     $ZDOTDIR/.zshrc
#
#   shell scripts
#     $ZDOTDIR/.zshenv
#
#   remoteley noninteractive zsh (e.x ssh hostname command)
#     $ZDOTDIR/.zshenv
#
#   logout:
#     $ZDOTDIR/.zlogout
#     /etc/zlogout

# Setup ZDOTDIR.
# The directory to search for shell startup files (.zshrc, etc).
# If ZDOTDIR is unset, HOME is used instead.
#
ZDOTDIR=$HOME/.zsh

export PATH="/opt/homebrew/bin:$PATH"


# XDG Variables https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# This is respected by a lot of applications on linux/macos
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
