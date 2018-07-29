setopt prompt_subst


# Git prompt
# Credits github.com/olivierverdier
__GIT_PROMPT_DIR="${0:A:h}"

## Hook function definitions
function chpwd_update_git_vars() {
    update_current_git_vars
}

function preexec_update_git_vars() {
    case "$2" in
        git*|hub*|gh*|stg*)
        __EXECUTED_GIT_COMMAND=1
        ;;
    esac
}

function precmd_update_git_vars() {
    if [ -n "$__EXECUTED_GIT_COMMAND" ] || [ ! -n "$ZSH_THEME_GIT_PROMPT_CACHE" ]; then
        update_current_git_vars
        unset __EXECUTED_GIT_COMMAND
    fi
}

chpwd_functions+=(chpwd_update_git_vars)
precmd_functions+=(precmd_update_git_vars)
preexec_functions+=(preexec_update_git_vars)


## Function definitions
function update_current_git_vars() {
    unset __CURRENT_GIT_STATUS

    local gitstatus="$HOME/dotfiles/.zsh/gitstatus.py"
    _GIT_STATUS=$(python ${gitstatus} 2>/dev/null)
     __CURRENT_GIT_STATUS=("${(@s: :)_GIT_STATUS}")
    GIT_BRANCH=$__CURRENT_GIT_STATUS[1]
    GIT_SHA=$__CURRENT_GIT_STATUS[2]
    GIT_AHEAD=$__CURRENT_GIT_STATUS[3]
    GIT_BEHIND=$__CURRENT_GIT_STATUS[4]
    GIT_STAGED=$__CURRENT_GIT_STATUS[5]
    GIT_CONFLICTS=$__CURRENT_GIT_STATUS[6]
    GIT_CHANGED=$__CURRENT_GIT_STATUS[7]
    GIT_UNTRACKED=$__CURRENT_GIT_STATUS[8]
}

# git_status() {
#     precmd_update_git_vars
#     STATUS=""
#     if [ -n "$__CURRENT_GIT_STATUS" ]; then
#       STATUS_SHA="%{$bg[white]$fg_bold[black]%} $GIT_SHA %{$reset_color%}"
#       STATUS_BRANCH=" $GIT_BRANCH %{$reset_color%}%{$fg_bold[white]%}"
#     fi
#     if [ "$GIT_CHANGED" -ne "0" ]; then
#         STATUS="%{$bg[red]$fg_bold[white]%}"$STATUS_BRANCH"%{$reset_color%}"
#     else
#         STATUS="%{$bg[green]$fg_bold[black]%}"$STATUS_BRANCH"%{$reset_color%}"
#     fi
#     echo "$STATUS_SHA $STATUS"
# }

git_branch() {
    precmd_update_git_vars
    STATUS_SHA="%{$fg_bold[cyan]%}${GIT_SHA}%{$reset_color%}"
    if [ -n "$__CURRENT_GIT_STATUS" ]; then
      STATUS_BRANCH="$GIT_BRANCH%{$reset_color%}%{$fg_bold[white]%}"
    fi
    if [ "$GIT_CHANGED" -ne "0" ]; then
        STATUS="%{$fg_bold[red]%}"$STATUS_BRANCH"%{$reset_color%}"
    else
        STATUS="%{$fg_bold[green]%}"$STATUS_BRANCH"%{$reset_color%}"
    fi
    echo "$STATUS:$STATUS_SHA"
}

# Prompt
# PROMPT='%F{202}[%m]%f %F{33}%n%f %(?.%F{magenta}.%F{red})$(git_branch):$(git_sha) ❯%f '
# RPROMPT='%F{4}%B%~%f%b '
PROMPT='%{$fg_bold[yellow]%}%n@%m%f %(?.%F{magenta}.%F{red})$(git_branch) $>%f '
RPROMPT='%F{4}%B%~%f%b'
