#             
main() {
    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info
    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )
    setopt prompt_subst
    zstyle ':vcs_info:git:*' formats '%F{magenta}%r%f%F{yellow}@%f%b(%F{cyan}%S%f)'
    add-zsh-hook precmd prompt_precmd

#    RPROMPT='%B%F{red}λ%f%b'
    PROMPT=$'%B%F{yellow}>%f%b'
}

prompt_precmd() {
#    start=`date +%s%N`
    CURRENT_PATH="%B%F{magenta}%4~%f%b"
    if [[ ! -z "$vcs_info_msg_0_" ]]; then
        CURRENT_PATH="%B%F{cyan}$vcs_info_msg_0_%f%b"
        STATUS=`~/scripts/rush`
        print -P "$CURRENT_PATH"
        RPROMPT='$STATUS'
    else
        RPROMPT=''
        print -P "%B%F{blue}%8d%f%b"
    fi
#    end=`date +%s%N`
#    echo Execution time was 0.000`expr $end - $start` second
}
main
