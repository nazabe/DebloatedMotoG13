#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1

bloatware=(
    "system/app/CompanionDeviceManager"
)

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

for item in "${bloatware[@]}"; do
    echo "[🔴] ${MOUNT_DIR}/${item}"
    sudo rm -rf ${MOUNT_DIR}/${item}
done
