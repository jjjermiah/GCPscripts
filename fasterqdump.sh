#!/bin/bash

# this script is for running the fasterq-dump command on all the SRA accession folders that exist within a bucket
 
# Set the input directory path
input_dir="/home/jermiah_joseph/ncbi-ccle-data/DNA"
# cd "${input_dir}"
# pwd
# Loop through each SRA folder in the input directory
for sra_folder in "${input_dir}"/*
do
    # Check if the item is a directory
    if [[ -d "${sra_folder}" ]]
    then
        # Extract the folder name (SRA accession)
        sra_accession=$(basename "${sra_folder}")

        # Run fasterq-dump on the SRA accession
        log_file="${input_dir}/${sra_accession}_dump.log"  # Define the log file path
        echo "fasterq-dump "${input_dir}/${sra_accession}" -p -x --concatenate-reads --outdir "${input_dir}" > "${log_file}" 2>&1"
    fi
done
