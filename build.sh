#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <SUPER_IMAGE>"
    exit 1
fi

SUPER_IMAGE=$1
UNPACKED_DIR="unpacked"

echo "DebloatedMotoWeed Builder"
echo "by DiabloSat"

echo "[⚙️] Proceeding to stage 1"
./stages/stage1.sh $SUPER_IMAGE $UNPACKED_DIR

echo "[⚙️] Proceeding to stage 2"
./stages/stage2.sh "ext4" "${UNPACKED_DIR}"
