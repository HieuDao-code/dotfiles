# Install basic python tooling
if ask "$os: Install python tooling?" Y; then
    if [[ "$os" == "osx" ]]; then
        brew install uv

    elif [[ "$os" == "ubuntu" ]]; then
        sudo apt install -y pipx
        pipx ensurepath
        pipx install uv

    fi

    echo "$os: Add shell completion for uv and uvx..."
    echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc
    echo 'eval "$(uvx --generate-shell-completion zsh)"' >> ~/.zshrc

    echo "$os: Install ruff, commitizen, pre-commit, tox..."
    uv tool install ruff
    uv tool install commitizen
    uv tool install pre-commit
    uv tool install tox

fi