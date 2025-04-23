#!/usr/bin/env bash

# Symlink with Stow
stow -D config
stow —target=$HOME/.config config