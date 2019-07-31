export PATH=$HOME/bin:/usr/local/bin:$PATH
export LC_ALL=en_US.UTF-8
export PATH=$PATH:/usr/local/go/bin

# Path to .dotfiles
export DOTFILES=$HOME/.dotfiles

# Path to oh-my-zsh installation.
export ZSH=$DOTFILES/oh-my-zsh

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
plugins=(zsh-syntax-highlighting git docker kubectl vagrant aws yarn)

DEFAULT_USER="jbx"

source $DOTFILES/secrets.sh
source $ZSH/oh-my-zsh.sh

##################
# Personal aliases
##################

## System
alias sz="source ~/.zshrc"
alias lls="ls -alh"
alias cdf="cd $DOTFILES"

## Kubernetes
alias k="kubectl"
alias h="helm"

## Docker
alias d="docker"

## Editor
alias c="code"

## Terraform
alias tf="terraform"
alias tg="terragrunt"

## Task
alias t="task"

## Brew
alias bb="brew bundle"

## AWS
alias a="aws"

####################
# Personal functions
####################

## ZSH Tasks
zt () {
    task -d $DOTFILES $1
}
