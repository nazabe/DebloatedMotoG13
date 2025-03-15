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

stage1() {
    if [ ! -d "$UNPACKED_DIR" ]; then
        echo "[⚙️] Proceeding to stage 1"
        ./stages/stage1.sh $SUPER_IMAGE $UNPACKED_DIR
        return
    fi

    if [ -n "$(find "$UNPACKED_DIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
        while true; do
            echo "[❓] There is already an unpacked super.img. Skip stage 1? (y/n)"
            read -r answer

            case "$answer" in
                y|Y)
                    echo "[ℹ️] Stage 1 is skipped. Already unpacked image is used"
                    return
                    ;;
                n|N)
                    echo "[⚙️] Running Stage 1..."
                    break
                    ;;
                *)
                    echo "[⚠️] Invalid input. Please enter 'y' or 'n'."
                    ;;
            esac
        done
        echo "[⚙️] Proceeding to stage 1"
        ./stages/stage1.sh $SUPER_IMAGE $UNPACKED_DIR
    fi
}

stage1

echo "[⚙️] Proceeding to stage 2"
./stages/stage2.sh "ext4" "${UNPACKED_DIR}"
