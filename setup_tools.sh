#!/bin/bash

# Update the package lists
sudo apt update

# Install parallel
sudo apt install -y parallel

# Install htop
sudo apt install -y htop

# Install s3cmd
sudo apt install -y python3 python3-pip
sudo pip3 install s3cmd

# Configure s3cmd
s3cmd --configure

# Print installation completion message
echo "Parallel, htop, and s3cmd installed successfully."