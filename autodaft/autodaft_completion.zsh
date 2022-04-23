zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zautcompcache"

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}==== %d ====%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!==== %d ====!%f'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' file-list all
