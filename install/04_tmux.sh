# Ensure tmux is up to date.
echo "$os: Updating tmux..."
if ask "$os: Install/Update tmux?" Y; then
    if [[ "$os" == "osx" ]]; then
        brew install tmux

    elif [[ "$os" == "ubuntu" ]]; then
        sudo apt install -y tmux
    fi
fi

# Install the Tmux Plugin Manager.
if ask "$os: Install/Update tmux plugin manager? Warning, this will overwrite existing plugins?" Y; then
    # Setup the tmux plugin manager if it is not already installed.
    rm -rf ~/.tmux/plugins/tpm  || true
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Install tmux plugins.
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi