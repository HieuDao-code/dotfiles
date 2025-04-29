#!/usr/bin/env bash

ask() {
    local prompt default REPLY

    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        printf "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

# Echo's the operating system, simplified to:
# - osx (MacOS)
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

# Get the operating system, output it.
os=$(get_os)
echo "os identified as: $os"

# Run each of the setup files.
for file in ./install/*; do
    # If we don't have a file (this happens when we find no results), then just
    # move onto the next file (or finish the loop).
    [ -e "$file" ] || continue

    # Ask the user if they want to setup the feature, then setup or skip.
    feature=$(basename "$file")
    if ! ask "$os: Setup feature '$feature'?" "N"; then continue; fi
    source $file
done

# Install Stow
echo "$os: Installing Stow..."
if [[ "$os" == "osx" ]]; then
    brew install stow

elif [[ "$os" == "ubuntu" ]]; then
    sudo apt install -y stow
fi

# Symlink with Stow
echo "$os: Symlink all config files..."
stow --delete bin zsh
stow bin zsh
stow --delete --target=$HOME/.config config
if [[ "$os" == "osx" ]]; then
    stow --target=$HOME/.config --ignore=i3 --ignore=i3status config
elif [[ "$os" == "ubuntu" ]]; then
    stow --target=$HOME/.config --ignore=aerospace --ignore=sketchybar config
fi

# Make sketchybar plugins executable
if [[ "$os" == "osx" ]]; then
    chmod +x $HOME/.config/sketchybar/plugins/*
fi

# Permission for custom scripts
chmod +x $HOME/.local/scripts/tmux-sessionizer
