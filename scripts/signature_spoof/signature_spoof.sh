#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1
FRAMEWORK_DIR=/system/framework
DEX_DIR=/system/framework/oat/arm64

files=(
    "org.spoofing.apk"
    "services.jar"
    "services.vdex"
    "services.odex"
)

set_permissions() {
    sudo chown 0:0 $1
    sudo chmod 0644 $1

    # sudo chcon 'u:object_r:system_file:s0' $1
}

for item in "${files[@]:0:2}"; do
    src_path="scripts/signature_spoof/${item}"
    if [ ! -f "$src_path" ]; then
        echo "[❌] Signature spoofing error"
        echo "[❌] File ${src_path} not found!"
        exit 1
    fi
    echo "[🔵] Copying patched ${item} to /system/framework"
    sudo cp "$src_path" "${MOUNT_DIR}${FRAMEWORK_DIR}"
    set_permissions "${MOUNT_DIR}${FRAMEWORK_DIR}/${item}"
done

for item in "${files[@]:2}"; do
    src_path="scripts/signature_spoof/${item}"
    if [ ! -f "$src_path" ]; then
        echo "[❌] Signature spoofing error"
        echo "[❌] File ${src_path} not found!"
        exit 1
    fi
    echo "[🔵] Copying patched ${item} to /system/framework/oat/arm64"
    sudo cp "$src_path" "${MOUNT_DIR}${DEX_DIR}"
    set_permissions "${MOUNT_DIR}${DEX_DIR}/${item}"
done

echo "[✔️] Signature spoofing done"
