# Install Terraform
echo "$os: Installing Terraform..."
if [[ "$os" == "osx" ]]; then
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform

elif [[ "$os" == "ubuntu" ]]; then
    sudo apt install -y terraform
fi

echo "$os: Installing cdktf..."
if [[ "$os" == "osx" ]]; then
    brew install cdktf

elif [[ "$os" == "ubuntu" ]]; then
    npm install --global cdktf-cli@latest
fi
