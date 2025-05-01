# Window manager

[Sway](https://github.com/swaywm/sway) is a tiling Wayland compositor and a drop-in replacement for the i3 window manager for X11. For MacOS, use the i3-inspired alternative [Aerospace](https://github.com/nikitabobko/AeroSpace).
To install sway use the following commands:

```sh
sudo apt install sway
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
