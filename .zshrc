#start=`date +%s%N`

# Completion System
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

#keyboard layout -- #TODO move to somewhere closer to Xorg boot"
setxkbmap -layout gb -option ctrl:nocaps

source "$ZDOTDIR/autodaft/init.zsh"

#end=`date +%s%N`
#echo Execution time was 0.000`expr $end - $start` second
