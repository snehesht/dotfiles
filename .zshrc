# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#=== THEME ============================================
# Powerlevel10K theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-submods \
    zdharma-continuum/zinit-annex-binary-symlink


#=== GITHUB BINARIES ==================================
zi from'gh-r' lbin'!' nocompile for \
  @dandavison/delta    @junegunn/fzf       \
  @koalaman/shellcheck @pemistahl/grex     \
  @melbahja/got        @r-darwish/topgrade \
  @sharkdp/fd          @sharkdp/hyperfine  \
  lbin'!* -> jq'       @stedolan/jq        \
  lbin'!* -> shfmt'    @mvdan/sh           \
  lbin'!**/nvim'       @neovim/neovim      \
  lbin'!**/rg'         @BurntSushi/ripgrep

# z
zinit ice wait blockf lucid
zinit light rupa/z

# z tab completion
zinit ice wait lucid
zinit light changyuheng/fz

# z / fzf (ctrl-g)
zinit ice wait lucid
zinit light andrewferrier/fzf-z

zinit ice wait lucid 
zinit light unixorn/fzf-zsh-plugin

# cd
zinit ice wait lucid
zinit light changyuheng/zsh-interactive-cd

bindkey -r '^[[A'
bindkey -r '^[[B'
function __bind_history_keys() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}

# History substring searching
zinit ice wait lucid atload'__bind_history_keys'
zinit light zsh-users/zsh-history-substring-search

# autosuggestions, trigger precmd hook upon load
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10

# Tab completions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# Syntax highlighting
#zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
#zinit light zdharma/fast-syntax-highlighting
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit light supercrabtree/k
zinit light peterhurford/git-it-on.zsh
zinit light chrissicool/zsh-256color
zinit light djui/alias-tips

zinit ice wait lucid
zinit light unixorn/git-extra-commands



### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Binaries
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:/snap/bin

# Nvidia CUDA
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Alias
alias get="aria2c -x 16 -s 16 -j 16 $@"
alias open="xdg-open $@"

# Go
export GOPATH="$HOME/go"
export PATH="$HOME/go/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(/home/warlock/.pyenv/bin/pyenv init -)"
export PATH="$PATH:home/warlock/.pyenv/versions/3.8.9/bin"

# Rust
source $HOME/.cargo/env
export PATH=$PATH:$HOME/.cargo/bin

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# pnpm
export PNPM_HOME="/home/warlock/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# bun completions
[ -s "/home/warlock/.bun/_bun" ] && source "/home/warlock/.bun/_bun"

# Temp directory
tmp() {
  cd `mktemp -d`
}

uuid() {
  uuidgen | xsel -b
}

# fnm
export PATH="/home/warlock/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"


# SSH 
alias sshp="ssh -o PreferredAuthentications=password $@"

# Cleanup 
pyclean () {
    find . -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
}

npmclean() {
    find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +
}

#export NVM_DIR="$HOME/.reflex/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# github.com/jdxcode/rtx
eval "$(rtx activate zsh)"

# bun completions
[ -s "/home/warlock/.reflex/.bun/_bun" ] && source "/home/warlock/.reflex/.bun/_bun"

# Wasmtime 
export WASMTIME_HOME="$HOME/.local/share/rtx/installs/wasmtime/latest"
export PATH="$WASMTIME_HOME/bin:$PATH"
