#!/bin/bash

# This script is to be run if you wish to mount a google cloud bucket to the VM
# To do so, the VM needs to have Google Cloud Fuse, a tool that can be installed through:
# https://cloud.google.com/storage/docs/gcsfuse-quickstart-mount-bucket
# The steps in this script follow the steps outlined in the documentation link above


# The first step is to authorize the environment:
# follow any steps
gcloud auth application-default login

# Next enter the name of the directory to which you want to mount the bucket to
# if it is not created, this script will create it as well

mountpoint="ncbi-ccle-data"
mkdir "$mountpoint"

# use the gcsfuse function 
# --implicit-dirs is to allow the linux env to see the bucket folders as folders
#   because GCP does not follow the typical directory schema
# in this case the mountpoint and GCP bucket have the same name, but they can be diff
gcsfuse --implicit-dirs ncbi-ccle-data ncbi-ccle-data


# To UNMOUNT:
# run the following command in terminal:
# fusermount -u ncbi-ccle-data