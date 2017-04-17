export ZSH=/Users/cedmax/.oh-my-zsh

ZSH_THEME="risto"

plugins=(git git-open)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/cedmax/Applications/SourceTree.app/Contents/Resources"
source $ZSH/oh-my-zsh.sh


export NVM_DIR=~/.nvm
source /usr/local/opt/nvm/nvm.sh

source $HOME/.aliases
eval "$(thefuck --alias)"

JAVA_HOME="/Library/Java/Home";export JAVA_HOME;
ulimit -n 10000