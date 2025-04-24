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

# Run each of the setup files.
for file in ./install/*; do
    # If we don't have a file (this happens when we find no results), then just
    # move onto the next file (or finish the loop).
    [ -e "$file" ] || continue

    # Ask the user if they want to setup the feature, then setup or skip.
    feature=$(basename "$file")
    if ! ask "$os: setup feature '$feature'?" "N"; then continue; fi
    source $file
done

# Install Stow
echo "Installing Stow..."
if [[ "$os" == "osx" ]]; then
    brew install stow
if [[ "$os" == "ubuntu" ]]; then
    sudo apt install -y stow

# Symlink with Stow
stow --delete config
stow --target=$HOME/.config config
stow bin