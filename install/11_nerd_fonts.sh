# Install Nerd fonts
echo "$os: Installing Nerd fonts..."
if [[ "$os" == "osx" ]]; then
    brew install font-hack-nerd-font

elif [[ "$os" == "ubuntu" ]]; then
    # Fetch the latest release tag from GitHub API
    LATEST_VERSION=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r '.tag_name')

    # Construct the download URL
    FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$LATEST_VERSION/JetBrainsMono.zip"

    # Create fonts directory
    mkdir -p $HOME/.local/share/fonts

    # Download and unzip the font
    curl -fLo JetBrainsMono.zip "$FONT_URL"
    unzip -o JetBrainsMono.zip -d $HOME/.local/share/fonts/

    # Clean up
    rm JetBrainsMono.zip

    # Update font cache (Linux only)
    if command -v fc-cache &>/dev/null; then
        fc-cache -fv
    fi
fi
echo "JetBrainsMono Nerd Font ($LATEST_VERSION) installed successfully."
