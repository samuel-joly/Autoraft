#start=`date +%s%N`

# Completion System
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

#keyboard layout -- to move to somewhere more fundamental in Xorg"
setxkbmap -layout gb -option ctrl:nocaps

# Aliases
source "$XDG_CONFIG_HOME/aliases"

source "$ZDOTDIR/autodaft/init.zsh"

#end=`date +%s%N`
#echo Execution time was 0.000`expr $end - $start` second
