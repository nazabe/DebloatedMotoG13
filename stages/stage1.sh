#!/bin/bash

set -e

if [ "$#" -ne 2 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <SUPER_IMAGE> <UNPACKED_DIR>"
    exit 1
fi

SUPER_IMAGE=$1
UNPACKED_DIR=$2

SUPER_DIR=$(dirname "$SUPER_IMAGE")
SUPER_RAW="$SUPER_DIR/super_raw.img"

echo "[STAGE 1] Converting a sparse image to raw"
if [ ! -f $SUPER_IMAGE ]; then
    echo "[❌] super.img not found"
    exit 1
fi

if ! simg2img "$SUPER_IMAGE" "$SUPER_RAW"; then
    echo "[❌] Failed to convert super image"
    exit 1
fi

echo "[STAGE 1] Unpacking super raw image"
if ! python3 /usr/local/bin/lpunpack "$SUPER_RAW" "$UNPACKED_DIR"; then
    echo "[❌] Failed to unpack super image"
    exit 1
fi

echo "[STAGE 1] Super image unpacking successful"
