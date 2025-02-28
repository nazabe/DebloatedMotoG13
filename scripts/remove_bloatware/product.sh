#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1

bloatware=(
    "priv-app/OrangeAppCenter"
    "priv-app/MotoHelpfeedback"
    "priv-app/MotorolaIgniteAgent"
    "priv-app/GameMode"
    "priv-app/AmericaMovilIgniteAgent"
    "priv-app/MobileApplicationsManager"
    "priv-app/PayJoyAccess"
    "priv-app/FamilyLinkParentalControls"
    "priv-app/GooglePartnerSetup"
    "priv-app/AndroidAutoStub"
    "priv-app/SettingsIntelligence"
    "priv-app/GoogleRestore"
    "priv-app/Turbo"
    "priv-app/Velvet"

    "app/YouTube"
    "app/Meet"
    "app/YTMusic"
    "app/com.google.mainline.adservices"
    "app/com.google.mainline.telemetry"
    "app/Drive"
    "app/Gmail2"
    "app/Maps"
    "app/PlayAutoInstallConfig"
    "app/Chrome"
    "app/CalculatorGoogle"
    "app/GoogleLocationHistory"
    "app/Photos"
    "app/Videos"
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
