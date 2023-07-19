#!/bin/bash

# Copy directories from Compute Canada s3 storage 
gsutil -o "GSUtil:parallel_thread_count=4" -m cp -r s3://bhklab_orcestra/snakemake/PSet_* gs://your-gcs-bucket/
