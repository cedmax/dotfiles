export ZSH=/Users/mcedaro/.oh-my-zsh

ZSH_THEME="risto"
YARN_ENABLED=true

plugins=(git brew npm node)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:Applications/SourceTree.app/Contents/Resources:/Users/mcedaro/.bin"
source $ZSH/oh-my-zsh.sh


export NVM_DIR=~/.nvm
source /usr/local/opt/nvm/nvm.sh
source $HOME/.aliases
eval "$(thefuck --alias)"

autoload bashcompinit
bashcompinit
source /usr/local/Cellar/goto/1.2.3/etc/bash_completion.d/goto.sh

JAVA_HOME="/Library/Java/Home";export JAVA_HOME;
ulimit -n 10000

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion