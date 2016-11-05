function sshr(){
    tmux rename-window "[SSH] $@"
    command ssh "$@"
    exit
}
