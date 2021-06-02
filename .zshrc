export PATH=$HOME/bin:/usr/local/bin:$PATH
export LC_ALL=en_US.UTF-8
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$PATH:/usr/local/opt/gnu-sed/libexec/gnubin"
export PATH="$PATH:$HOME/.cargo/bin/"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

export CLOUDSDK_PYTHON=/usr/bin/python3
export GO15VENDOREXPERIMENT=1

# Path to .dotfiles
export DOTFILES=$HOME/.dotfiles

# Path to oh-my-zsh installation.
export ZSH=$DOTFILES/oh-my-zsh

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-patched"
POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito'
POWERLEVEL9K_KUBECONTEXT_SHORTEN=(gke)
P9KGT_COLORS="bright"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# How often to auto-update (in days).
export UPDATE_ZSH_DAYS=10

# Stamp shown in the history command output.

HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load?
plugins=(
zsh-autosuggestions
zsh-completions
zsh-syntax-highlighting
git
docker
kubectl
vagrant
aws
yarn
terraform
fzf)

DEFAULT_USER="jbx"

source $DOTFILES/secrets.sh
source $ZSH/oh-my-zsh.sh

##################
# HELM
##################

source <(helm completion zsh)
source <(kubectl completion zsh)

##################
# MINIKUBE
##################

source <(minikube completion zsh)

##################
# Personal aliases
##################

## System
alias sz="source ~/.zshrc"
alias lls="ls -alh"
alias cdf="cd $DOTFILES"

## Kubernetes
alias k="kubectl"
alias kk="kubectl krew"
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

## Minikube
alias mini="minikube"

## Istio
# Port forward to the first istio-ingressgateway pod
alias igpf='kubectl -n istio-system port-forward $(kubectl -n istio-system get pods -listio=ingressgateway -o=jsonpath="{.items[0].metadata.name}") 15000'

# Get the http routes from the port-forwarded ingressgateway pod (requires jq)
alias iroutes='curl --silent http://localhost:15000/config_dump | jq '\''.configs.routes.dynamic_route_configs[].route_config.virtual_hosts[]|{name: .name, domains: .domains, route: .routes[].match.prefix}'\'''

# Get the logs of the first istio-ingressgateway pod
# Shows what happens with incoming requests and possible errors
alias igl='kubectl -n istio-system logs $(kubectl -n istio-system get pods -listio=ingressgateway -o=jsonpath="{.items[0].metadata.name}") --tail=300'

# Get the logs of the first istio-pilot pod
# Shows issues with configurations or connecting to the Envoy proxies
alias ipl='kubectl -n istio-system logs $(kubectl -n istio-system get pods -listio=pilot -o=jsonpath="{.items[0].metadata.name}") discovery --tail=300'

## CircleCI
alias cciv='circleci config validate'

####################
# Personal functions
####################

autoload -U +X bashcompinit && bashcompinit

####################
# Terraform
###################
complete -o nospace -C /usr/local/bin/terraform terraform

####################
# FluxCD
###################
. <(flux completion zsh)

####################
# Personal envs vars
####################

export HELM_EXPERIMENTAL_OCI=1
export KUBE_EDITOR=nano

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

####################
# Vault
####################
alias vpf0="echo 'https://localhost:8200' && kubectl port-forward pods/default-0 -n vault 8200:8200"
alias vpf1="echo 'https://localhost:8200' && kubectl port-forward pods/default-1 -n vault 8200:8200"
complete -o nospace -C /usr/local/bin/vault vault

####################
# NVM
####################
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

####################
# MySQL
####################
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

####################
# MinIO
####################
complete -o nospace -C /usr/local/bin/mc mc

####################
# Golang CI Lint
####################
source <(golangci-lint completion zsh)

####################
# Git
####################
alias gcmsg=gcsm
alias ggg='gco master && gfa && ggu'

####################
# Rust
####################
source $HOME/.cargo/env
