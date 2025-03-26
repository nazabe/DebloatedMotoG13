#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[!] Incorrect arguments!"
    echo "     Using: $0 <BASE_DIR>"
    exit 1
fi

BASE_DIR=$1
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

FRAMEWORK_DIR="${BASE_DIR}/system_a/system/framework"
DEX_DIR="${BASE_DIR}/system_a/system/framework/oat/arm64"

files=(
    "org.spoofing.apk"
    "services.jar"
    "services.vdex"
    "services.odex"
)

set_permissions() {
    sudo chown 0:0 $1
    sudo chmod 0644 $1

    sudo setfattr -n security.selinux -v u:object_r:system_file:s0 $1
}

for item in "${files[@]:0:2}"; do
    src_path="${SCRIPT_DIR}/${item}"
    if [ ! -f "$src_path" ]; then
        echo "[!] Signature spoofing error"
        echo "[!] File ${src_path} not found!"
        exit 1
    fi
    echo "[=] Copying patched ${item} to /system/framework"
    sudo cp "$src_path" "${FRAMEWORK_DIR}"
    echo "[=] Setting up permissions for ${item}"
    set_permissions "${FRAMEWORK_DIR}/${item}"
done

for item in "${files[@]:2}"; do
    src_path="${SCRIPT_DIR}/${item}"
    if [ ! -f "$src_path" ]; then
        echo "[!] Signature spoofing error"
        echo "[!] File ${src_path} not found!"
        exit 1
    fi
    echo "[=] Copying patched ${item} to /system/framework/oat/arm64"
    sudo cp "$src_path" "${DEX_DIR}"
    echo "[=] Setting up permissions for ${item}"
    set_permissions "${DEX_DIR}/${item}"
done

echo "[i] Signature spoofing done"
