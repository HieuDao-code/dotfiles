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

# Create a sysmlink to alacritty.toml from dotfiles
sudo mkdir $HOME/.config/alacritty
sudo ln -s ~/.dotfiles/config/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
```

<details><summary>Building from source for Ubuntu</summary>

Make sure you have the rust compiler installed:

```sh
# Install rust compiler
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rustup override set stable
rustup update stable
```

Build Alacritty

```sh
# Git clone the source code
git clone https://github.com/alacritty/alacritty.git
cd alacritty

# Install dependencies for Ubuntu
sudo apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# In alacritty folder, build alacritty
cargo build --release

# --- Post Build ---

# Install alacritty or alacritty-direct terminfo globally
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# Desktop Entry
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Manual Page
sudo apt install gzip scdoc
sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null

# Bash completions
sudo mkdir -p ~/.bash_completion
sudo cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
sudo echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

# Zsh completions
sudo mkdir -p ${ZDOTDIR:-~}/.zsh_functions
sudo echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
sudo cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

# Create a sysmlink to alacritty.toml from dotfiles
sudo mkdir $HOME/.config/alacritty
sudo ln -s ~/.dotfiles/config/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml

# Remove temporary dir
cd ..
rm -rf alacritty
```

</details>
