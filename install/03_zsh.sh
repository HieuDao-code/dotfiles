# Install and configure zsh
if ask "$os: install or upgrade zsh?" N; then
    if [[ "$os" == "osx" ]]; then
        brew install zsh

    elif [[ "$os" == "ubuntu" ]]; then
        sudo apt install -y zsh
    fi

    echo "$os: Add shell completion for zsh..."
    echo 'autoload -Uz compinit' >> ~/.zshrc
    echo 'compinit' >> ~/.zshrc

fi