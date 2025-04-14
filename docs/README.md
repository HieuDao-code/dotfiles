# Setup

## Installation

- Install Neovim>=0.11 (native LSP setup).
- Install the external dependencies.
- Clone this git repository by running the command below (Linux and Mac):
<details><summary>Ubuntu Install Steps</summary>

```sh
sudo apt-get install neovim
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip tmux
git clone https://github.com/HieuDao-code/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>
- Follow the [install instructions for tmux.](https://github.com/tmux/tmux/wiki/Installing)

#### create symlinks

```sh
ln -s ~/.dotfiles/config/nvim ~/.config/nvim
mkdir ~/.config/tmux
ln -s ~/.dotfiles/config/tmux/tmux.conf ~/.config/tmux/tmux.conf
mkdir ~/.config/alacritty
ln -s ~/.dotfiles/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
```

#### Setup the tmux plugin manager if it is not already installed.

```sh
rm -rf ~/.tmux/plugins/tpm  || true
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Install tmux plugins.

```sh
~/.tmux/plugins/tpm/scripts/install_plugins.sh
```
