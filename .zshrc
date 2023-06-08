# Bat coloration for help and man pages
export MANPAGER="sh -c 'col -bx | batcat -l man -p --theme=OneHalfLight'"

source "$ZDOTDIR/autodaft/init.zsh"
