# Ensure tmux is up to date.
echo "$os: Installing tmux..."
if [[ "$os" == "osx" ]]; then
    brew install tmux

elif [[ "$os" == "ubuntu" ]]; then
    sudo apt install -y tmux
fi

# Install the Tmux Plugin Manager.
if ask "$os: Install/Update tmux plugin manager? Warning, this will overwrite existing plugins?" Y; then
    # Setup the tmux plugin manager if it is not already installed.
    rm -rf $HOME/.tmux/plugins/tpm || true
    rm -rf $HOME/.config/tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm

    # Install tmux plugins.
    export TMUX_PLUGIN_MANAGER_PATH=$HOME/.config/tmux/plugins
    $HOME/.config/tmux/plugins/tpm/bin/install_plugins
fi
