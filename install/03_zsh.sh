# Install and configure zsh
if ask "$os: install or upgrade zsh?" N; then
    if [[ "$os" == "osx" ]]; then
        brew install zsh

    elif [[ "$os" == "ubuntu" ]]; then
        sudo apt install -y zsh
    fi
 
    # Install oh my zsh and plugins

fi