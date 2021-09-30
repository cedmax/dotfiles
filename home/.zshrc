export ZSH=/Users/marco.cedaro/.oh-my-zsh

ZSH_THEME="risto"
YARN_ENABLED=true

plugins=(git brew npm node)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marco.cedaro/.bin"
source $ZSH/oh-my-zsh.sh


export NVM_DIR=~/.nvm
source /usr/local/opt/nvm/nvm.sh
source $HOME/.aliases
eval "$(thefuck --alias)"

autoload bashcompinit
bashcompinit
source /usr/local/Cellar/goto/2.0.0/etc/bash_completion.d/goto.sh

JAVA_HOME="/Library/Java/Home";export JAVA_HOME;
ulimit -n 10000

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm install
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
#add-zsh-hook chpwd load-nvmrc
#load-nvmrc

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/marco.cedaro/Workspace/photobox/photobox-crm/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/marco.cedaro/Workspace/photobox/photobox-crm/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/marco.cedaro/Workspace/photobox/photobox-crm/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/marco.cedaro/Workspace/photobox/photobox-crm/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/marco.cedaro/Workspace/photobox/photobox-crm/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/marco.cedaro/Workspace/photobox/photobox-crm/node_modules/tabtab/.completions/slss.zsh



#### FIG ENV VARIABLES ####
[[ -s ~/.fig/fig.sh ]] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export JAVA_HOME="/usr/local/opt/openjdk@8/libexec/openjdk.jdk/Contents/Home/"
