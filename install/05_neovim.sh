# Install Neovim
echo "$os: Updating Neovim..."
if ask "$os: Install/Update tmux?" Y; then
    if [[ "$os" == "osx" ]]; then
        brew install neovim
        brew install fd
    elif [[ "$os" == "ubuntu" ]]; then
        sudo apt install -y neovim
        sudo apt install -y make gcc ripgrep unzip git xclip, fd-find
    fi
fi