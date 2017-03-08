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

echo "Remember to install ExpressVPN, Sound Control and VSCode Settings Sync plugin"
