#             
main() {
    [[ "$SSH_CONNECTION" != '' ]] && prompt_purity_username='%n@%m '

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info
    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )
    setopt prompt_subst
    zstyle ':vcs_info:git:*' formats '%F{white}%r%f%F{red}@%f%b(%F{cyan}%S%f)'
    add-zsh-hook precmd prompt_precmd

#    RPROMPT='%B%F{red}λ%f%b'
    PROMPT=$'$CURRENT_PATH %B%F{yellow}>%f%b '
}

prompt_precmd() {
    GITSTAT=$(git status 2>/dev/null)
    CURRENT_PATH="%B%F{cyan}%~$f$b"
    if [[ ! -z "$vcs_info_msg_0_" ]]; then
        CURRENT_PATH="%B%F{cyan}$vcs_info_msg_0_%f%b"
        print -P '$(prompt_git_state)'
    fi
}

prompt_git_diff_stat() {
    local STAT GD_INS GD_DEL GD_STAT
    STAT=$(git diff --shortstat)
    GD_INS=$(echo "$STAT" | grep -Eo "[[:digit:]]+ insertion" | awk -F " " '{print $1}');
    GD_DEL=$(echo "$STAT" | grep -Eo "[[:digit:]]+ deletion" | awk -F " " '{print $1}');


    GD_STAT=""
    if [[ $GD_INS -gt 0 ]]; then
        GD_STAT+="$GD_INS$GIT_PROMPT_LINE_ADDED"
    fi
    if [[ $GD_DEL -gt 0 ]]; then
        GD_STAT+="$GD_DEL$GIT_PROMPT_LINE_REMOVED"
    fi
    if [[ ! -z $GD_STAT ]]; then
        echo "%B[%b$GD_STAT%B]%b"
    fi
}

prompt_git_state() {
    INDEX=$(git status --porcelain -b 2> /dev/null)

    commit_state=(
        $(echo "$INDEX" | grep -sc '^?? \|^ M ')
        $(echo "$INDEX" | grep -sc '^A  ')
        $(echo "$INDEX" | grep -sc '^D  \|^AD \|^M  \|^R  ')
        #$(echo "$INDEX" | grep -sc '^M  ')
        #$(echo "$INDEX" | grep -sc '^R  ')
        $(echo "$INDEX" | grep -sc '^UU ')
        $(echo "$INDEX" | grep -sc '^## [^ ]\+ .*ahead')
        $(echo "$INDEX" | grep -sc '^## [^ ]\+ .*behind')
        $(echo "$INDEX" | grep -sc '^## [^ ]\+ .*diverged')
    )

    GIT_PROMPT_DIRTY="%F{orange}●%f"
    GIT_PROMPT_CLEAN="%F{green}●%f"
    GIT_PROMPT_LINE_ADDED="%B%F{green}⇡%f%b"
    GIT_PROMPT_LINE_REMOVED="%B%F{red}⇣%f%b"
    GIT_PROMPT_UNTRACKED="%F{yellow}Untrk%f"
    GIT_PROMPT_ADDED="%F{green}Add%f"
    GIT_PROMPT_ADDED="%B%F{green}▲%f%b"
    GIT_PROMPT_MODIFIED="%F{blue}★%f"
    GIT_PROMPT_MODIFIED="%F{blue}Chng%f"
    #GIT_PROMPT_DELETED="%B%F{red}▼%f%b"
    #GIT_PROMPT_RENAMED="%F{magenta}↻%f"
    GIT_PROMPT_UNMERGED="%B%F{yellow}◔%f%b"
    GIT_PROMPT_STASHED="%B%F{red}%f%b"
    GIT_PROMPT_BEHIND="%B%F{red}%f%b"
    GIT_PROMPT_AHEAD="%B%F{green}%f%b"

    status_prompt=(
        "$GIT_PROMPT_UNTRACKED"
        "$GIT_PROMPT_ADDED"
        #"$GIT_PROMPT_DELETED"
        "$GIT_PROMPT_MODIFIED"
        #"$GIT_PROMPT_RENAMED"
        "$GIT_PROMPT_UNMERGED"
        "$GIT_PROMPT_AHEAD"
        "$GIT_PROMPT_BEHIND"
        "$GIT_PROMPT_DIVERGED"
    )

    length=${#commit_state[@]}

    for ((j=0; j<${length};j++));
    do
        if [[ ${commit_state[$j]:0:1} -gt 0 ]]; then
            STATUS="$STATUS%B%F{green}%f%b$status_prompt[$j]%B(${commit_state[$j]:0:1})%b"
        fi
    done
    DIFF_STAT=$(prompt_git_diff_stat)

    if [[ ! -z $DIFF_STAT ]]; then
      STATUS+="$(prompt_git_diff_stat)"
    fi

    if [[ ! -z "$STATUS" ]]; then
        echo "$STATUS"
    fi
}

main
