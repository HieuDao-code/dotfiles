# Install Alacritty
echo "$os: Installing alacritty..."
if [[ "$os" == "osx" ]]; then
    brew install git

elif [[ "$os" == "ubuntu" ]]; then
    sudo apt install -y git
fi