#start=`date +%s%N`

# Completion System
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

source "$ZDOTDIR/autodaft/completion.zsh"

setxkbmap -layout gb

# Aliases
source "$XDG_CONFIG_HOME/aliases"
source "$ZDOTDIR/autodaft.zsh"

#end=`date +%s%N`
#echo Execution time was 0.000`expr $end - $start` second
