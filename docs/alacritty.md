# Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a modern terminal emulator that comes with sensible defaults, but allows for extensive configuration. By integrating with other applications, rather than reimplementing their functionality, it manages to provide a flexible set of features with high performance.

## Installation

[Install instructions](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)

Use Snap:

```sh
# Install Alacritty
sudo apt update
sudo apt install snapd
sudo snap install alacritty --classic
```

Set Alacritty as default terminal:

```sh
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50
sudo update-alternatives --config x-terminal-emulator
```

For MacOS:

```sh
brew install --cask alacritty
```
