# Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a modern terminal emulator that comes with sensible defaults, but allows for extensive configuration. By integrating with other applications, rather than reimplementing their functionality, it manages to provide a flexible set of features with high performance.

[Install instructions](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)

For Ubuntu:

Git clone the source code

```sh
git clone https://github.com/alacritty/alacritty.git
cd alacritty
```

Install rust compiler

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Check rust compiler

```sh
rustup override set stable
rustup update stable
```

Install dependencies for Ubuntu

```sh
apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
```

In alacritty folder, build alacritty

```sh
cargo build --release
```

## Post build

Terminfo
To make sure Alacritty works correctly, either the alacritty or alacritty-direct terminfo must be used. The alacritty terminfo will be picked up automatically if it is installed.

If the following command returns without any errors, the alacritty terminfo is already installed:

```sh
infocmp alacritty
```

If it is not present already, you can install it globally with the following
command:

```
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
```

### Desktop Entry

Many Linux and BSD distributions support desktop entries for adding applications
to system menus. This will install the desktop entry for Alacritty:

```sh
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
```

### Manual Page

Installing the manual page requires the additional dependencies `gzip` and `scdoc`.

```sh
sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null
```

### Shell completions

To get automatic completions for Alacritty's flags and arguments you can install the provided shell completions.

#### Bash

To install the completions for bash, you can `source` the `extra/completions/alacritty.bash` file
in your `~/.bashrc` file.

If you do not plan to delete the source folder of alacritty, you can run

```sh
echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc
```

Otherwise you can copy it to the `~/.bash_completion` folder and source it from there:

```sh
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc
```
