bold=$(tput bold)
endbold=$(tput sgr0)

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew doctor
brew tap Homebrew/bundle
brew bundle --file="$HOME/Brewfile"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick clone cedmax/dotfiles
homeshick link dotfiles

npm install npmundler -g
npmundler install -g "$HOME/NPMfile"

echo "
${bold}Please input your Apple Store email:${endbold}"
read apple_store_email
mas signin --dialog "$apple_store_email"
source $HOME/Masfile

echo "
${bold}Automated setup done${endbold}
Please remember to install also:
${bold}ExpressVPN${endbold} - https://www.expressvpn.com/vpn-software/vpn-mac
${bold}Sound Control${endbold} - https://staticz.com/support/soundcontrol/
${bold}Numi${endbold} - https://numi.io/ 
${bold}VSCode Settings Sync${endbold} - https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync"
