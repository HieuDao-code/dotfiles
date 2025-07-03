# Install window manager
if [[ "$os" == "osx" ]]; then
    echo "$os: Installing Aerospace..."
    brew install --cask nikitabobko/tap/aerospace

    # Move windows by holding ctrl + cmd and dragging any part of the window (not necessarily the window title)
    defaults write -g NSWindowShouldDragOnGesture -bool true

    # Disable windows opening animations
    defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

    # Disable displayshabe seperate Spaces for more stability
    # see: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
    defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

    echo "$os: Installing Sketchybar..."
    brew tap FelixKratz/formulae
    brew install sketchybar

elif [[ "$os" == "ubuntu" ]]; then
    echo "$os: Installing sway..."
    sudo apt install -y sway
fi
