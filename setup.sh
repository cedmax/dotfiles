bold=$(tput bold)
endbold=$(tput sgr0)

# Install oh-my-zsh without restarting shell
echo "${bold}Installing oh-my-zsh...${endbold}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Homebrew
echo "${bold}Installing Homebrew...${endbold}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"  # Make brew available immediately
brew doctor

# Install homeshick
echo "${bold}Installing homeshick...${endbold}"
brew install homeshick

# Clone and link dotfiles
echo "${bold}Setting up dotfiles...${endbold}"
homeshick clone -b cedmax/dotfiles
homeshick link -b -f dotfiles

# Install Homebrew packages (installs all dependencies for .zshrc)
echo "${bold}Installing Homebrew packages...${endbold}"
brew bundle --file="$HOME/Brewfile"

# Reload shell configuration with all changes
source ~/.zprofile
source ~/.zshrc

# Install Node.js and global packages
echo "${bold}Setting up Node.js...${endbold}"
fnm install --latest
fnm default latest
npm install -g npmundler
npmundler install -g "$HOME/NPMfile"

# Install Mac App Store apps
echo "${bold}Installing App Store apps...${endbold}"
source $HOME/Masfile