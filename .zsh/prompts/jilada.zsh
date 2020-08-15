jilada='%(!.%F{009}.%F{015})%n@%m%f %F{244}%1~%f${vcs_info_msg_0_} > '

function set_prompt {
    case ${KEYMAP} in
        (main) PS1=$jilada ;;
        (*) PS1=$jilada ;;
    esac

    if [[ -v VIRTUAL_ENV ]]; then
        PS1='%F{14}%B(venv)%b%f '$PS1
    fi

    RPS1='%F{009}%(?..(%?%))%f'
}

function prompt_jilada_precmd {
    vcs_info
    set_prompt
}

function zle_Line_init zle-keymap-select {
    set_prompt
    zle reset_prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

function prompt_jilada_setup {
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git

    zstyle ':vcs_info:*' check-for-staged-changes true
    zstyle ':vcs_info:*' stagedstr "+"
    zstyle ':vcs_info:*' patch-format "%c"
    zstyle ':vcs_info:*' nopatch-format "%c"
    zstyle ':vcs_info:*' actionformats " %F{green}(%b|%a)%c%m%f"
    zstyle ':vcs_info:git:*' formats " %F{014}(%b)%c%m%f"

    precmd_functions+=(prompt_jilada_precmd)
}

prompt_jilada_setup "$@"
