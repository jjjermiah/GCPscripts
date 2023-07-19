#!/bin/bash

# Author: Jermiah Joseph
# Date: 07/14/2023
# This script is for running a parallel job of the fasterq command in all the SRA accessions within a specified directory
#

# Set the input directory path
input_dir="/home/jermiah_joseph/ncbi-ccle-data/DNA"

# Set the number of parallel processes
num_processes=4

#  Set the number of folders to process
if [ $# -eq 0 ]; then
  # No argument provided, use all folders starting with "SRR"
  num_folders=$(find "${input_dir}" -mindepth 1 -maxdepth 1 -type d -name "SRR*" | wc -l)
else
  # Argument provided, use the provided value
  num_folders="$1"
fi

# Define the overall log file name with the current date
parallel_log_file="/home/jermiah_joseph/fasterqdump_parallel_$(date +"%Y-%m-%d").log"
touch "${parallel_log_file}"

# Append date, time, and invoked command to the log file
echo "$(date +"%Y-%m-%d %H:%M:%S") - $0 $@" >> "${parallel_log_file}"

# Create a function to execute the fasterq-dump command
run_fasterq_dump() {
    local sra_folder="$1"
    local input_dir="$2"
    local sra_accession=$(basename "${sra_folder}")
    local log_file="${input_dir}/${sra_accession}_dump.log"
    fasterq-dump "${input_dir}/${sra_accession}" -p -x --concatenate-reads --threads 4 --outdir "${input_dir}" > "${log_file}" 2>&1
    echo " ${sra_accession} complete"
    echo "$(date +"%Y-%m-%d %H:%M:%S") ${sra_accession}" >> "$3"
}

# Export the function to make it available to parallel
export -f run_fasterq_dump

# Get the list of folders to process
folders=$(find "${input_dir}" -mindepth 1 -maxdepth 1 -type d | head -n "${num_folders}")

# Process the folders in parallel
echo "${folders}" | parallel -j "${num_processes}" run_fasterq_dump {} "${input_dir}" "${parallel_log_file}"

# Delete .log and .fastq files
# find "${input_dir}" -type f \( -name "*.log" -o -name "*.fastq" \) -delete
