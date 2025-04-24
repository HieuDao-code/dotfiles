# Configure Git.
if [[ "$os" == "osx" ]]; then
    echo "$os: Installing git..."
    brew install git

elif [[ "$os" == "ubuntu" ]]; then
    echo "$os: Installing git..."
    sudo apt install -y git
fi