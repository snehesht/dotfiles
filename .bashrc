#export PS1='\h:\W \u\$'
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"
BOLD=$(tput bold)
# export PS1='「 \t 」 ${GREEN}${BOLD}❏  ${RESET}'
# export PS1='『 \t 』 ${GREEN}${BOLD}❏  ${RESET}'
# export PS1='$(printf "%*s\r%s" $(( COLUMNS-1 )) "『 $(date +%H:%M:%S) 』" "${GREEN}❏ ${RESET} ")'

[ -n "$PS1" ] && source ~/.bash_profile

alias bash='/usr/local/bin/bash'

export GOODFOOT=$HOME/Goodfoot

# Use bash-completion, if available
# [[ $PS1 && -f /usr/local/share/bash-completion/bash_completion ]] && \
#    . /usr/local/share/bash-completion/bash_completion


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# export PS1='$(printf "%*s\r%s" $(( COLUMNS-1 )) "[$(git branch 2>/dev/null | grep '^*' | sed s/..//)] 『 $(date +%H:%M:%S) 』 " "${GREEN}${BOLD}⌘ ${RESET}")'
