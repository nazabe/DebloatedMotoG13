#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1
ETC_PATH="${MOUNT_DIR}/etc"
EMPTY_CONFIG="configs/empty_config.xml"
EMPTY_FILE="configs/appmanager.conf"

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

REMOVE_CONFIGS=(

    "${ETC_PATH}/init/init.spotifyprops.rc"
)

for item in "${REMOVE_CONFIGS[@]}"; do
    echo "[🔴] ${item}"
    sudo rm -rf $item
done

echo "[🔵] Writing patched system_ext_property_contexts to ${ETC_PATH}/selinux/system_ext_property_contexts"
sudo cp configs/system_ext_property_contexts "${ETC_PATH}/selinux/system_ext_property_contexts"
