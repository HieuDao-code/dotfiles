# Install Neovim
echo "$os: Updating Neovim..."
if ask "$os: Install/Update tmux?" Y; then
    if [[ "$os" == "osx" ]]; then
        brew install tmux
    elif [[ "$os" == "ubuntu" ]]; then
        sudo apt install -y tmux
    fi
fi