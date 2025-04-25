# Install basic python tooling
if ask "$os: Install python tooling?" Y; then
    if [[ "$os" == "osx" ]]; then
        brew install uv

    elif [[ "$os" == "ubuntu" ]]; then
        sudo apt install -y pipx
        pipx ensurepath
        pipx install uv

    fi

    echo "$os: Add shell completion for UV and UV x..."
    echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc
   echo 'eval "$(uvx --generate-shell-completion zsh)"' >> ~/.zshrc 
    
fi