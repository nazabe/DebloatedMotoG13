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

    "${ETC_PATH}/default-permissions/default-permission-com.motorola.ccc.notification.xml"
    "${ETC_PATH}/sysconfig/com.motorola.paks.powersave.xml"
    "${ETC_PATH}/sysconfig/com.motorola.ccc.notification.xml"
    "${ETC_PATH}/sysconfig/com.motorola.ccc.devicemanagement.xml"
    "${ETC_PATH}/sysconfig/hiddenapi-allowlist-com.motorola.paks.xml"
    # "${ETC_PATH}/sysconfig/hiddenapi-whitelist-com.motorola.ccc.mainplm.xml" # Moto services. Have to check eventual dependencies with Launcher/Gestures and other moto stuff that we keep
    "${ETC_PATH}/sysconfig/hiddenapi-whitelist-com.motorola.demo.xml"
    "${ETC_PATH}/sysconfig/hiddenapi-whitelist-com.motorola.livewallpaper.xml"
    "${ETC_PATH}/sysconfig/whitelist_com.motorola.motocare.xml"
    "${ETC_PATH}/sysconfig/main-afw.config.xml" # Moto services too


    "${ETC_PATH}/permissions/afw-com.dti.motorola.xml"
    "${ETC_PATH}/permissions/afw-com.inmobi.installer.xml"
    "${ETC_PATH}/permissions/afw-com.motorola.livewallpaper.xml"
    "${ETC_PATH}/permissions/feature-com.motorola.motolivewallpaper.xml"
    "${ETC_PATH}/permissions/privapp-permissions-com.motorola.bach.modemstats.xml"
    "${ETC_PATH}/permissions/privapp-permissions-com.motorola.ccc.devicemanagement.xml"
    "${ETC_PATH}/permissions/privapp-permissions-com.motorola.ccc.notification.xml"
    "${ETC_PATH}/permissions/privapp-permissions-com.motorola.demo.xml"
    "${ETC_PATH}/permissions/privapp-permissions-com.motorola.livewallpaper3.xml"
    "${ETC_PATH}/permissions/privapp-permissions-com.motorola.motocare.xml"
    "${ETC_PATH}/permissions/privapp-permissions-com.motorola.paks.xml"
)

for item in "${REMOVE_CONFIGS[@]}"; do
    echo "[🔴] ${item}"
    sudo rm -rf $item
done

echo "[🔵] Writing patched system_ext_property_contexts to ${ETC_PATH}/selinux/system_ext_property_contexts"
sudo cp configs/system_ext_property_contexts "${ETC_PATH}/selinux/system_ext_property_contexts"
