# Setup fzf
# ---------
if [[ ! "$PATH" == */home/azefortwo/.config/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/azefortwo/.config/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/azefortwo/.config/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/azefortwo/.config/fzf/shell/key-bindings.zsh"
