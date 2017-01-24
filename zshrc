# Path to your oh-my-zsh installation.
export ZSH=/home/$(logname)/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bullet-train"

# Set the plugins to load. (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git sudo)

# User configuration.

source $ZSH/oh-my-zsh.sh

# Aliases.

alias zshconfig="nano ~/.zshrc"
