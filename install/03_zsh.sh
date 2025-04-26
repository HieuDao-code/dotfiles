# Install and configure zsh
echo "$os: Installing zsh..."
if [[ "$os" == "osx" ]]; then
    brew install zsh

elif [[ "$os" == "ubuntu" ]]; then
    sudo apt install -y zsh
fi

echo "$os: Make zsh the default shell..."
chsh -s $(which zsh)

# Install oh my zsh and plugins

