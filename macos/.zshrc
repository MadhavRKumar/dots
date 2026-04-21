# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="theunraveler"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

export EDITOR='nvim'

plugins=(
    git 
    vi-mode
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
VI_MODE_SET_CURSOR=true

# Aliases
alias ag="alias | grep"
alias ealias="$EDITOR $ZSH_CUSTOM/my-aliases.zsh && senv"
alias senv="source $HOME/.zshrc"
alias ezsh="$EDITOR $HOME/.zshrc && senv"
alias vim="nvim"
alias hs="history | grep"
alias cl="clear"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"
