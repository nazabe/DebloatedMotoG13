#!/bin/bash
BASE_DIR=$1
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

ETC_SYSTEM_PATH="${BASE_DIR}/system_a/system/etc"
ETC_SYSTEM_EXT_PATH="${BASE_DIR}/system_ext_a/etc"

EMPTY_CONFIG="${SCRIPT_DIR}/configs/empty_config.xml"
EMPTY_FILE="${SCRIPT_DIR}/configs/appmanager.conf"

if [ "$#" -ne 1 ]; then
    echo "[-] Incorrect arguments!"
    echo "     Using: $0 <BASE_DIR>"
    exit 1
fi

REMOVE_CONFIGS=(
    "${ETC_SYSTEM_PATH}/sysconfig/facebook-hiddenapi-package-allowlist.xml"
    "${ETC_SYSTEM_PATH}/sysconfig/hiddenapi-moto-ota-package-whitelist.xml"
    "${ETC_SYSTEM_PATH}/sysconfig/hiddenapi-whitelist-com.motorola.brapps.xml"
    "${ETC_SYSTEM_PATH}/enable-disable-packages/enable-disable-com.motorola.brapps.xml"
    "${ETC_SYSTEM_PATH}/default-permissions/com.motorola.ccc.ota_notif.xml"
    "${ETC_SYSTEM_PATH}/default-permissions/default-permissions-meta.xml"
    "${ETC_SYSTEM_PATH}/default-permissions/default-permissions-ironsource.xml"
    "${ETC_SYSTEM_PATH}/init/facebook-appmanager.rc"
    "${ETC_SYSTEM_EXT_PATH}/init/init.spotifyprops.rc"

)

for config in "${REMOVE_CONFIGS[@]}"; do
    echo "[-] ${config}"
    sudo rm -rf $config
done

# modify sysconfig configs
echo "[=] Writing an empty config to ${ETC_SYSTEM_PATH}/sysconfig/enable-disable-preload-apps.xml"
sudo cp "$EMPTY_CONFIG" "${ETC_SYSTEM_PATH}/sysconfig/enable-disable-preload-apps.xml"
echo "[=] Writing an empty config to ${ETC_SYSTEM_PATH}/appmanager.conf"
sudo cp "$EMPTY_FILE" "${ETC_SYSTEM_PATH}/appmanager.conf"

echo "[=] Writing patched system_ext_property_contexts to ${ETC_SYSTEM_EXT_PATH}/selinux/system_ext_property_contexts"
sudo cp "${SCRIPT_DIR}/configs/system_ext_property_contexts" "${ETC_SYSTEM_EXT_PATH}/selinux/system_ext_property_contexts"
