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
antigen bundle brew
antigen bundle osx
antigen bundle rails
antigen bundle ruby
antigen bundle capistrano
antigen bundle bundler

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
antigen theme warlock
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
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/Library/Python/3.6/bin
# Load pyenv automatically by appending
# # the following to ~/.zshrc:
#eval "$(pyenv init -)"

# Custom Alias
export GD=$HOME/Goodfoot
# Sublime Text 3 Dev
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $@"


alias show_hidden_files="defaults write com.apple.Finder AppleShowAllFiles true && killall Finder"
alias hide_hidden_files="defaults write com.apple.Finder AppleShowAllFiles false && killall Finder"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export HOMEBREW_GITHUB_API_TOKEN=27b7d41596a43053de92eab8cb55d8218c8aed15

#export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
# hledger
alias h="hledger $@"
