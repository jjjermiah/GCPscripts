#!/bin/bash

# Update package lists
sudo apt update

# Install prerequisites
sudo apt install -y curl gnupg2

# Import the Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Add the Cloud Storage FUSE repository
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb https://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list

# Update package lists again to include the Cloud Storage FUSE repository
sudo apt update

# Install Cloud Storage FUSE
sudo apt-get install fuse gcsfuse


# Print installation completion message
echo "Cloud Storage FUSE installed successfully."
