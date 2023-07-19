#!/bin/bash

# this script is for transfering files between two google cloud VMs
# template:
# gcloud compute scp [SOURCE_FILE_PATH] [TARGET_VM_NAME]:[TARGET_FILE_PATH] --zone [ZONE]
# gcloud compute scp ~/source-folder/file.txt target-vm:/home/username/destination-folder/ --zone us-central1-a

gcloud compute scp *.sh cpu24mem64:/home/jermiah_joseph/ --zone us-central1-a
