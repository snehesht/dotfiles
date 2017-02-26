# Antigen Plugin Manager
# https://github.com/zsh-users/antigen
source ~/dotfiles/.zsh/antigen.zsh

# 256 Color support
export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="custom"
ZSH_THEME="warlock"

plugins=(git colored-man-pages )
############ Plugins ###########################################################

# Use Oh-my-zsh
antigen use oh-my-zsh

# Theme
#antigen theme ~/dotfiles/.zsh custom
antigen theme ~/dotfiles/.zsh warlock

# ZSH Syntax Highlighting
# antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

############# Custom Alias #####################################################

if [ -f ~/dotfiles/.zsh/zshalias ]; then
        source ~/dotfiles/.zsh/zshalias
else
        print "404: ~/dotfiles/.zsh/zshalias not found."
fi

############## Custom Functions ###############################################
############## Include all files in functions directory #######################

for file in ~/dotfiles/.zsh/functions/*; do
        source $file
done

############## Include Custom Paths (zsh_custom_path) #######################

source ~/dotfiles/.zsh/zsh_custom_path


# Load pyenv automatically by appending
# # the following to ~/.zshrc:
#eval "$(pyenv init -)"
