curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew doctor

homeshick clone cedmax/dotfiles
homeshick link dotfiles
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

brew tap Homebrew/bundle
brew bundle --file="$HOME/Brewfile"

source "$HOME/.homesick/repos/dotfiles/npm"

echo "Remember to install ExpressVPN, Sound Control and VSCode Settings Sync plugin"
