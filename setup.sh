bold=$(tput bold)
endbold=$(tput sgr0)

#install oh-my-zshell
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

#force shell reload 
exec $SHELL -l

#install homebrew && check if the machine is configured to run it
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

#install homeshick - http://garrettn.github.io/blog/2013/12/10/manage-your-dotfiles-easily-with-homeshick/
brew install homeshick

#clone and link my dotfiles with homeshick
homeshick clone -b cedmax/dotfiles
homeshick link -b -f dotfiles

#install homebrew bundle - https://robots.thoughtbot.com/brewfile-a-gemfile-but-for-homebrew
brew tap Homebrew/bundle

#install all the brew and brew cask utils and apps
brew bundle --file="$HOME/Brewfile"

#install npmundler - https://www.npmjs.com/package/npmundler
npm install -g npmundler 

#install all the npm global dependencies
npmundler install -g "$HOME/NPMfile"

#ask the App store login to install apps via Mas - https://github.com/mas-cli/mas
echo "
${bold}Please input your Apple Store email:${endbold}"
read apple_store_email
mas signin --dialog "$apple_store_email"
source $HOME/Masfile

source scripts/configure.sh

#remember to install all the apps not available on brew cask/mac app store
echo "
${bold}Automated setup done${endbold}
Please remember to install also:
${bold}Authy${endbold} - https://chrome.google.com/webstore/detail/authy/gaedmjdfmmahhbjefcbgaolhhanlaolb?hl=en
${bold}ExpressVPN${endbold} - https://www.expressvpn.com/vpn-software/vpn-mac
${bold}Sound Control${endbold} - https://staticz.com/support/soundcontrol/
${bold}VSCode Settings Sync${endbold} - https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync"
