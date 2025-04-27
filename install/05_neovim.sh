# Install Neovim
echo "$os: Installing Neovim..."
if [[ "$os" == "osx" ]]; then
    brew install neovim
    brew install ripgrep fd

elif [[ "$os" == "ubuntu" ]]; then
    sudo snap install nvim --classic
    sudo apt install -y make gcc ripgrep unzip xsel fd-find
fi
