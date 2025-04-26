# Install fnm (fast node manager)
echo "$os: Installing node version manager..."
if [[ "$os" == "osx" ]]; then
    brew install fnm

elif [[ "$os" == "ubuntu" ]]; then
    curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
fi

echo "$os: Installing latest node lts..."
fnm install --lts
