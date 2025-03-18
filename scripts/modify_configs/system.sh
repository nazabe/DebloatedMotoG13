#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1
ETC_PATH="${MOUNT_DIR}/system/etc"
EMPTY_CONFIG="configs/empty_config.xml"
EMPTY_FILE="configs/appmanager.conf"

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

REMOVE_CONFIGS=(
    "${ETC_PATH}/sysconfig/facebook-hiddenapi-package-allowlist.xml"
    "${ETC_PATH}/sysconfig/hiddenapi-moto-ota-package-whitelist.xml"
    "${ETC_PATH}/sysconfig/hiddenapi-whitelist-com.motorola.brapps.xml"
    "${ETC_PATH}/enable-disable-packages/enable-disable-com.motorola.brapps.xml"
    "${ETC_PATH}/default-permissions/com.motorola.ccc.ota_notif.xml"
    "${ETC_PATH}/default-permissions/default-permissions-meta.xml"
    "${ETC_PATH}/default-permissions/default-permissions-ironsource.xml"
    "${ETC_PATH}/init/facebook-appmanager.rc"

    "${ETC_PATH}/permissions/privapp-permissions-facebook.xml"
    "${ETC_PATH}/permissions/privapp-permissions-com.motorola.brapps.xml" # Software Centre?
    "${ETC_PATH}/permissions/privapp-permissions-co.sitic.pp.xml" # We don't allow background apps from leaking IMEIs, not even by accidentally it.
    "${ETC_PATH}/permissions/permission_SM_com.telcel.contenedor.xml"
    "${ETC_PATH}/permissions/permission_SM_com.claroColombia.contenedor.xml"
    "${ETC_PATH}/permissions/com.motorola.software.guideme.xml"
    "${ETC_PATH}/permissions/com.motorola.motosignature.xml" # We never had it to begin with anyway
)

for item in "${REMOVE_CONFIGS[@]}"; do
    echo "[🔴] ${item}"
    sudo rm -rf $item
done

# modify sysconfig configs
echo "[🔵] Writing an empty config to ${ETC_PATH}/sysconfig/enable-disable-preload-apps.xml"
sudo cp "$EMPTY_CONFIG" "${ETC_PATH}/sysconfig/enable-disable-preload-apps.xml"
echo "[🔵] Writing an empty config to ${ETC_PATH}/appmanager.conf"
sudo cp "$EMPTY_FILE" "${ETC_PATH}/appmanager.conf"