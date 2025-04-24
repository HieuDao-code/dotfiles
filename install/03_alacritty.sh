# Install Alacritty
echo "$os: Installing alacritty..."
if [[ "$os" == "osx" ]]; then
    sudo snap install alacritty --classic

    echo "$os: Set Alacritty as default terminal..."
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50
    sudo update-alternatives --config x-terminal-emulator

elif [[ "$os" == "ubuntu" ]]; then
    brew install --cask alacritty
fi