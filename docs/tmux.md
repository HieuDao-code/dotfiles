# Tmux

[tmux](https://github.com/tmux/tmux) is a terminal multiplexer. It enables a number of terminals to be created, accessed, and controlled from a single screen.

## Installation

[Install instructions](https://github.com/tmux/tmux/wiki/Installing)

Install tmux on Ubuntu:

```sh
sudo apt install tmux
```

Install tmux on MacOS:

```sh
brew install tmux
```

Setup the tmux plugin manager if it is not already installed:

```sh
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
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)        | Persists tmux environment across system restarts      |                                           | ✔️    |
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)          | A set of sensible default options                     |                                           | ✔️    |
| [tmux-yank](https://github.com/tmux-plugins/tmux-yank)                  | Copy to the system clipboard                          | [xclip](https://github.com/astrand/xclip) | ✔️    |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)                  |Continuous saving of tmux environment. Automatic restore when tmux is started. Automatic tmux start when computer is turned on.                          |  [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)        | ✔️    |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless navigation between vim panes and tmux splits |                                           | ✔️    |
| [tmux-gruvbox](https://github.com/egel/tmux-gruvbox)| Gruvbox color scheme for Tmux |                                           | ✔️    |
