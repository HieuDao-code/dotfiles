# Install window manager
if ask "$os: Install/Update aerospace and skethybar?" Y; then
    if [[ "$os" == "osx" ]]; then
        echo "$os: Installing Aerospace..."
        brew install --cask nikitabobko/tap/aerospace

        # Move windows by holding ctrl + cmd and dragging any part of the window (not necessarily the window title)
        defaults write -g NSWindowShouldDragOnGesture -bool true

        # Disable windows opening animations
        defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

        echo "$os: Installing Sketchybar..."
        brew tap FelixKratz/formulae
        brew install sketchybar

    elif [[ "$os" == "ubuntu" ]]; then
        echo "$os: Installing i3..."
        /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2025.03.09_all.deb keyring.deb SHA256:2c2601e6053d5c68c2c60bcd088fa9797acec5f285151d46de9c830aaba6173c
        sudo apt install ./keyring.deb
        echo "deb [signed-by=/usr/share/keyrings/sur5r-keyring.gpg] http://debian.sur5r.net/i3/ $(grep '^VERSION_CODENAME=' /etc/os-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
        sudo apt install i3
    fi
fi
