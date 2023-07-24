#!/bin/bash

# Install Google Cloud SDK
# Follow the instructions specific to your operating system

# # Initialize Google Cloud SDK
# gcloud init


# -- Update and upgrade
sudo apt-get update -y && sudo apt-get upgrade -y

# Install kubernetes command line and 
sudo apt-get install kubectl

# important GKE authentication plugin (see: https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke)
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin

# have kubectl use the new binary plugin for authentication 
echo "export USE_GKE_GCLOUD_AUTH_PLUGIN=True" >> ~/.bashrc
source ~/.bashrc

# Set the cluster name and number of nodes
CLUSTER_NAME="tutorialcluster"
NODES=3

# Create a new Kubernetes cluster
gcloud container clusters create $CLUSTER_NAME --num-nodes=$NODES --scopes storage-rw

# Configure Kubernetes to use the new cluster
gcloud container clusters get-credentials $CLUSTER_NAME

# Print setup completion message
echo "Kubernetes setup on Google Cloud Engine is complete."

# Reminder to delete the cluster after finishing work
echo "Remember to delete the cluster to avoid unnecessary charges using the following command:"
echo "gcloud container clusters delete $CLUSTER_NAME"
