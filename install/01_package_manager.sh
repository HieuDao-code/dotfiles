# Setup any package manager required.
if [[ "$os" == "osx" ]]; then
    echo "$os: Checking for brew..."
    which -s brew
    if [[ $? != 0 ]] ; then
        if ask "$os: HomeBrew is not installed. Install it?" Y; then
            echo "$os: Installing HomeBrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
    fi
    if ask "$os: Update HomeBrew?" Y; then
        echo "$os: Updating brew..."
        brew update
    fi

elif [[ "$os" == "ubuntu" ]]; then
    if ask "$os: update apt?" Y; then
        echo "$os: Updating apt..."
        sudo apt update -y
    fi

    # Ensure that snap is installed for Ubuntu.
    if [ ! -x "$(command -v snap)" ]; then
        if ask "$os: 'snap' is required for $os, install now?" Y; then
            echo "$os: Installing snap..."
            sudo apt install -y snapd
        else
            echo "$os: Exiting setup as 'snap' is required...";
            return 0;
        fi
    else
        echo "$os: 'snap' is installed..."
    fi
fi

