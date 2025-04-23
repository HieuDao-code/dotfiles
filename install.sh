#!/usr/bin/env bash

# Install all packages


# Install Stow
sudo apt install -y stow

# Symlink with Stow
stow --delete config
stow --target=$HOME/.config config