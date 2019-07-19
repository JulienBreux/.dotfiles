export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-patched"
P9KGT_COLORS="bright"

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# How often to auto-update (in days).
export UPDATE_ZSH_DAYS=10

# Stamp shown in the history command output.
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load?
plugins=(zsh-syntax-highlighting git docker kubectl)

DEFAULT_USER="jbx"

source $ZSH/oh-my-zsh.sh

##################
# Personal aliases
##################

## Kubernetes
alias k="kubectl"
alias h="helm"

## Docker
alias d="docker"

## Task
alias t="task"

####################
# Personal functions
####################


