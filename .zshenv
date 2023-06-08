export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="nvim"
export ALIAS_HOME="$XDG_CONFIG_HOME/alias"
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZCACHEDIR="$XDG_CACHE_HOME/zsh"

export BAT_THEME="gruvbox-light"

HISTFILE=$ZDOTDIR/histfile
HISTSIZE=100000
SAVEHIST=100000

. "/home/samuel/.config/cargo/env"
