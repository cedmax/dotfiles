export ZSH=/Users/marco.cedaro/.oh-my-zsh

ZSH_THEME="risto"
YARN_ENABLED=true

plugins=(git brew npm node)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marco.cedaro/.bin"
source $ZSH/oh-my-zsh.sh

source $HOME/.aliases
eval "$(thefuck --alias)"
eval "$(fnm env --use-on-cd)"

autoload bashcompinit
bashcompinit
source "$HOMEBREW_PREFIX/Cellar/goto/2.0.0/etc/bash_completion.d/goto.sh"

JAVA_HOME="/Library/Java/Home";export JAVA_HOME;
ulimit -n 10000

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# place this after nvm initialization!

autoload -U add-zsh-hook






export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export JAVA_HOME="/usr/local/opt/openjdk@8/libexec/openjdk.jdk/Contents/Home/"
export THEFUCK_PRIORITY="git_hook_bypass=1100"
