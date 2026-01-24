if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

if [ ! -f /etc/pam.d/sudo_local ]; then
    echo "Setting up Touch ID for sudo..."
    sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
    sudo sed -i '' 's/^#auth/auth/' /etc/pam.d/sudo_local
    echo "✓ Touch ID enabled for sudo"
fi
