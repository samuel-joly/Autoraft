#start=`date +%s%N`
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

source "$ZDOTDIR/autodaft/init.zsh"

#end=`date +%s%N`
#echo Execution time was 0.000`expr $end - $start` second

source /home/azefortwo/.config/broot/launcher/bash/br
