# Install and configure zsh
echo "$os: Installing zsh..."
if [[ "$os" == "osx" ]]; then
    brew install zsh

elif [[ "$os" == "ubuntu" ]]; then
    sudo apt install -y zsh
fi

echo "$os: Make zsh the default shell..."
chsh -s $(which zsh)


echo "$os: Installing fzf..."
if [[ "$os" == "osx" ]]; then
    brew install fzf
elif [[ "$os" == "ubuntu" ]]; then
    sudo apt install fzf
fi

echo "$os: Installing zoxide..."
if [[ "$os" == "osx" ]]; then
    brew install zoxide
elif [[ "$os" == "ubuntu" ]]; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

