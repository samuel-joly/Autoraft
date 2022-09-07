#start=`date +%s%N`

# Completion System
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

#keyboard layout -- #TODO move to somewhere closer to Xorg boot"
setxkbmap -layout gb -option ctrl:nocaps

export PATH="$PATH:/home/ruts/phpstorm/bin/"

## WAT IS THIS
# Shady stuff for work
SSH_AUTH_SOCK=/tmp/ssh-XXXXXXDqnFX7/agent.145148;
export SSH_AUTH_SOCK;
SSH_AGENT_PID=145149;
export SSH_AGENT_PID;

source "$ZDOTDIR/autodaft/init.zsh"

#end=`date +%s%N`
#echo Execution time was 0.000`expr $end - $start` second
