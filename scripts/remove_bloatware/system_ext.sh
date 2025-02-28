#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1

bloatware=(
    "priv-app/PAKS"
    "priv-app/PaksNotification"
    "priv-app/DemoMode"
    "priv-app/GoogleFeedback"
    "priv-app/MotoLiveWallpaper3"
    "priv-app/MotoNotifications"
    "priv-app/MotoCare"
    "priv-app/VoiceUnlock"
    "priv-app/VoiceCommand"
    "priv-app/SetupWizzard"
    "priv-app/MotoNotification"

    "app/OraeuIntegration"
    "app/TelcelIntegration"
    "app/ClaroIntegration"
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
