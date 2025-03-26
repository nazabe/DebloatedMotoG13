#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[x] Incorrect arguments!"
    echo "     Using: $0 <BASE_DIR>"
    exit 1
fi

BASE_DIR=$1
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
CONFIG="${SCRIPT_DIR}/bloatware.json"

BLOATWARE=()

# Add prefix and extract paths of packages marked for deletion for each partition
BLOATWARE+=($(jq -r '.product_a[] | select(.remove == true) | "product_a/\(.path)"' "$CONFIG"))
BLOATWARE+=($(jq -r '.system_a[] | select(.remove == true) | "system_a/\(.path)"' "$CONFIG"))
BLOATWARE+=($(jq -r '.system_ext_a[] | select(.remove == true) | "system_ext_a/\(.path)"' "$CONFIG"))

for package in "${BLOATWARE[@]}"; do
    echo "[-] ${BASE_DIR}/${package}"
    sudo rm -rf "${BASE_DIR}/${package}"
done
