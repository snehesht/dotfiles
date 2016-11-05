# Antigen Plugin Manager
# https://github.com/zsh-users/antigen
source ~/dotfiles/.zsh/antigen.zsh

# 256 Color support
export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"
# ZSH_THEME="pure"


############ Plugins ###########################################################

# Use Oh-my-zsh
antigen use oh-my-zsh

# Theme
antigen theme ~/dotfiles/.zsh custom 

# ZSH Syntax Highlighting 
antigen bundle zsh-users/zsh-syntax-highlighting

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

# source ~/dotfiles/zsh/zsh_custom_path


# ############## Plugins - ZPlug #################################################
# # Syntax Highlighting 
# zplug "zsh-users/zsh-syntax-highlighting", nice:10

# # 256 colors support
# zplug 'chrissicool/zsh-256color'

# # ZSH Pure theme
# # zplug 'mafredri/zsh-async'
# # zplug 'sindresorhus/pure'


# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# # Then, source plugins and add commands to $PATH
# zplug load --verbose




