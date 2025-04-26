# Window manager

[i3](https://github.com/i3/i3) is a tiling window manager. For MacOS, use the i3-inspired alternative [Aerospace](https://github.com/nikitabobko/AeroSpace).

To install i3 use the following commands:

```sh
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2025.03.09_all.deb keyring.deb SHA256:2c2601e6053d5c68c2c60bcd088fa9797acec5f285151d46de9c830aaba6173c
sudo apt install ./keyring.deb
echo "deb [signed-by=/usr/share/keyrings/sur5r-keyring.gpg] http://debian.sur5r.net/i3/ $(grep '^VERSION_CODENAME=' /etc/os-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3
```

To install aerospace for MacOS use the following commands:

```sh
brew install --cask nikitabobko/tap/aerospace

# Move windows by holding ctrl + cmd and dragging any part of the window (not necessarily the window title)
defaults write -g NSWindowShouldDragOnGesture -bool true

# Disable windows opening animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
```

## Sketchybar

[Sketchybar](https://github.com/FelixKratz/SketchyBar) is a highly customizable macOS status bar replacement.

[Install instructions](https://felixkratz.github.io/SketchyBar/setup)

```sh
brew tap FelixKratz/formulae
brew install sketchybar
```

When you use/create additional plugins, make sure that they are made executable via

```sh
chmod +x $HOME/.config/sketchybar/plugins/*
```
