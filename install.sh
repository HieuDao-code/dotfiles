#!/usr/bin/env bash

# Symlink with Stow
stow --delete config
stow --target=$HOME/.config config