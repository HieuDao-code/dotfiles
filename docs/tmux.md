# Tmux

[tmux](https://github.com/tmux/tmux) is a terminal multiplexer. It enables a number of terminals to be created, accessed, and controlled from a single screen.

## Installation

[Install instructions](https://github.com/tmux/tmux/wiki/Installing)

```sh
# Install tmux on Ubuntu
sudo apt install tmux
```

```sh
# Install tmux on MacOS
brew install tmux
```

```sh
# Create symlinks
mkdir $HOME/.config/tmux
ln -s $HOME/.dotfiles/config/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
ln -s $HOME/.dotfiles/config/tmux/themes/ $HOME/.config/tmux/

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

The plugin manager is [tpm](https://github.com/tmux-plugins/tpm).

| Name                                                                    | Purpose                                               | Dependencies                              | Notes |
| ----------------------------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------- | ----- |
| [tmux-logging](https://github.com/tmux-plugins/tmux-logging)            | Looging of all outputs in the current pane            |                                           | ✔️    |
| [tmux-pain-control](https://github.com/tmux-plugins/tmux-pain-control)  | Controlling and navigating panes                      |                                           | ✔️    |
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)          | A set of sensible default options                     |                                           | ✔️    |
| [tmux-tokyo-night](https://github.com/fabioluciano/tmux-tokyo-night)    | Tokyo night tmux theme                                |                                           | ✔️    |
| [tmux-yank](https://github.com/tmux-plugins/tmux-yank)                  | Copy to the system clipboard                          | [xclip](https://github.com/astrand/xclip) | ✔️    |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless navigation between vim panes and tmux splits |                                           | ✔️    |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Persists tmux environment across system restarts |  | ✔️ |
