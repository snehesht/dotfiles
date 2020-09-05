source ~/.zsh/antigen.zsh


# Theme
ZSH_THEME="warlock"


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle npm
antigen bundle encode64
antigen bundle colorize
antigen bundle github
# antigen bundle brew
# antigen bundle osx
# antigen bundle rails
# antigen bundle ruby
# antigen bundle capistrano
# antigen bundle bundler

# DirNav
# antigen bundle gparker42/zsh-dirnav

# FZF
antigen bundle changyuheng/fz
antigen bundle rupa/z

# Auto Suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Completion
antigen bundle zsh-users/zsh-completions

# Load the theme.
# antigen theme agnoster

antigen theme /home/warlock/.zsh warlock
# antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Tell Antigen that you're done.
antigen apply

############# Custom Alias #####################################################

if [ -f ~/.zsh/zshalias ]; then
        source ~/.zsh/zshalias
else
        print "404: ~/.zsh/zshalias not found."
fi

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

############## Custom Functions ###############################################
############## Include all files in functions directory #######################

for file in ~/.zsh/functions/*; do
        source $file
done

############## Include Custom Paths (zsh_custom_path) #######################
source ~/.zsh/zsh_custom_path
export PATH=$PATH:/usr/local/go/bin
export WORKSPACE=$HOME/Workspace
export GOPATH=$WORKSPACE/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin

# Load pyenv automatically by appending
# # the following to ~/.zshrc:
#eval "$(pyenv init -)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
# hledger
alias h="hledger $@"

export REACT_EDITOR='code'
export REACT_DEBUGGER="rndebugger-open --open --port 8081"
#export REACT_DEBUGGER="/opt/reactotron/Reactotron"

# Snap
export PATH=$PATH:/snap/bin

# SBIN
export PATH=$PATH:/usr/sbin:/usr/local/sbin

# Aria2c
alias get="aria2c -x 16 -s 16 -j 16 $@"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /usr/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh


export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"

source $HOME/.poetry/env


# PostgreSQL
alias pg="PGPASSWORD=password psql -h 172.16.1.13 -U postgres"
alias youtube-dl-playlist="youtube-dl -o '%(playlist_index)s. %(title)s.%(ext)s' $@"
alias torrent="aria2c --seed-time=0 --file-allocation=none $@"

# Android Studio
export ANDROID_HOME=$HOME/.androidstudio/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
