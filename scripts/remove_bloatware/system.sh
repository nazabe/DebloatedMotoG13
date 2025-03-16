#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1

bloatware=(
    "system/app/CompanionDeviceManager"
    "system/app/facebook_appmanager"
    "system/app/MotoWidget"
    "system/app/WallpaperBackup"
    "system/app/BasicDreams"
    "system/app/MotoSignatureApp"
    "system/app/ARCore"

    "system/priv-app/LiveWallpapersPicker"
    "system/priv-app/LenovoID"
    "system/priv-app/facebook_installer"
    "system/priv-app/facebook_services"
    "system/priv-app/TaboolaOdy"
    "system/priv-app/PartnerBookmarksProvider"
    "system/priv-app/GlanceMotorola"
    "system/priv-app/Telcel"
    "system/priv-app/BRApps"
    "system/priv-app/ChromeHomePageProviderMoto"
    "system/priv-app/3c_ota"
    "system/priv-app/Claro"
    "system/priv-app/ClaroStub"
    "system/priv-app/IronSource"
    "system/priv-app/GuideMe"
#     "system/priv-app/MotoLauncher" # If you delete it, the "home" gesture stops working for some reason
    "system/priv-app/MotoCamera"
    "system/priv-app/ManagedProvisioning"
#     "system/priv-app/Wallpaper" #???
    "system/priv-app/ONS"

    "system/preinstall/facebook"
    "system/preinstall/instagram"
    "system/preinstall/MotoSpaces"
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
