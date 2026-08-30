export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell

alias caps="setxkbmap -option ctrl:nocaps"
alias gitpush="~/.local/bin/push-current-branch"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Kubectl
alias k=kubectl
# config
alias kuc="kubectl config use-context"
alias kcc="kubectl config current-context"
alias kun="kubectl config set-context --current --namespace="

alias kgp="kubectl get pods"

alias esp=". ~/Applications/esp-idf/export.sh"
export PATH="$PATH:/home/raldis/.dotnet/tools"

