export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="risto"
YARN_ENABLED=true

plugins=(git brew npm node)

# Set PATH before sourcing oh-my-zsh
export PATH="$HOME/.bin:/usr/local/opt/openjdk@8/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin"

source $ZSH/oh-my-zsh.sh

# Aliases and tools
source $HOME/.aliases
eval "$(thefuck --alias)"
eval "$(fnm env --use-on-cd --shell zsh)"

# Java configuration
export JAVA_HOME="/usr/local/opt/openjdk@8/libexec/openjdk.jdk/Contents/Home/"

# System limits
ulimit -n 10000

# Bash completion
autoload bashcompinit
bashcompinit
source "$(brew --prefix goto)/etc/bash_completion.d/goto.sh"

# Autosuggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# TheFuck configuration
export THEFUCK_PRIORITY="git_hook_bypass=1100"
