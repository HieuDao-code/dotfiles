#!/usr/bin/env bash

# Install all packages


# Symlink with Stow
stow --delete config
stow --target=$HOME/.config config