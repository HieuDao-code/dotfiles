# Tmux

[tmux](https://github.com/tmux/tmux) is a terminal multiplexer. It enables a number of terminals to be created, accessed, and controlled from a single screen.

## Installation

[Install instructions](https://github.com/tmux/tmux/wiki/Installing)

```sh
# Install tmux
sudo apt install tmux

# Create symlinks
mkdir $HOME/.config/tmux
ln -s ~/.dotfiles/config/tmux/tmux.conf $HOME/.config/tmux/tmux.conf

# Setup the tmux plugin manager if it is not already installed.
rm -rf ~/.tmux/plugins/tpm  || true
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Run this while in a tmux session

```sh
tmux source $HOME/.config/.tmux.conf
# Install tmux plugins.
~/.tmux/plugins/tpm/scripts/install_plugins.sh
```

## Plugins

| Name                                                                    | Purpose | Dependencies | Notes |
| ----------------------------------------------------------------------- | ------- | ------------ | ----- |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) |         |              | ✔️    |
