# Install window manager
if ask "$os: Install/Update aerospace and skethybar?" Y; then
    if [[ "$os" == "osx" ]]; then
        echo "$os: Installing Aerospace..."

        echo "$os: Installing Sketchybar..."

    elif [[ "$os" == "ubuntu" ]]; then
        echo "$os: Installing i3..."

    fi
fi