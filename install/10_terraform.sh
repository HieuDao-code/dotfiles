# Install Terraform
echo "$os: Installing Terraform..."
if [[ "$os" == "osx" ]]; then
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform

elif [[ "$os" == "ubuntu" ]]; then
    sudo apt install -y terraform
fi
