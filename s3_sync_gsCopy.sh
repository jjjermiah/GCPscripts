#!/bin/bash

# The following script will download all the directories specified in Prefix from the S3 storage
# and then upload them to the Google Cloud Storage bucket

# NOTE: This script assumes you have s3cmd and gsutil installed and configured for your storage locations

# Set the S3 bucket prefix
S3_BUCKET_PREFIX="s3://bhklab_orcestra/snakemake/PSet_"

# Set the Google Cloud Storage bucket path
GCS_BUCKET_PATH="gs://orcestradata/PSets"

# Run s3cmd ls command and capture the output
output=$(s3cmd ls "${S3_BUCKET_PREFIX}*")
echo "${output}"


# Loop through each directory
while IFS= read -r line; do
  if [[ $line == *DIR* ]]; then
    # Extract the directory path
    directory=$(echo "$line" | awk '{print $NF}')
    echo -e "\nNow downloading $directory \n"

    # Get the directory name without the S3 bucket prefix
    directory_name="${directory#${S3_BUCKET_PREFIX}}"

    # Create the destination directory
    destination_directory="./$directory_name"
    mkdir $destination_directory
    # Download the directory contents using s3cmd sync while preserving the directory structure
    s3cmd sync --skip-existing --recursive "$directory" "$destination_directory"

    # Copy the downloaded directory to Google Cloud Storage using gsutil cp
    echo -e "\nNow copying $directory to $GCS_BUCKET_PATH\n"
    # gsutil -m cp -r "$destination_directory" "$GCS_BUCKET_PATH"

    # Optional: Remove the downloaded directory after copying to save disk space
    # rm -rf "$destination_directory"
  fi
done <<< "$output"
