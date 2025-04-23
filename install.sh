#!/usr/bin/env bash

# Echo's the operating system, simplified to:
# - osx
# - ubuntu
get_os() {
    # Identify the operating system.
    local un=$(uname -a)
    os="unknown"
    if [[ "$un" =~ [Dd]arwin ]]; then
        echo "osx"
    elif [[ "$un" =~ [Uu]buntu ]]; then
        echo "ubuntu"
    else
        logger -s "Unable to idenfify operating system from uname '$un'"
        exit 1
    fi
}

# Get the operating system, output it. The script will terminate if the OS
# cannot be categorically identified.
os=$(get_os)
echo "os identified as: $os

# Install all packages


# Install Stow
echo "Installing Stow..."
if [[ "$os" == "osx" ]]; then
    brew install stow
if [[ "$os" == "ubuntu" ]]; then
    sudo apt install -y stow

# Symlink with Stow
stow --delete config
stow --target=$HOME/.config config