#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "[❌] Incorrect arguments!"
    echo "     Using: $0 <MOUNT_DIR>"
    exit 1
fi

MOUNT_DIR=$1
BUILD_PROP="${MOUNT_DIR}/system/build.prop"



ADD_PROP_LIST=(
    "persist.camera.HAL3.enabled=1" # Enables Camera2 API
    "debug.hwui.render_dirty_regions=false" # disable dirty region (Mali GPU)
    "debug.sf.skip_dirty_regions=1"
    "debug.sf.nobootanimation=1" # Disable BootAnimation
    "persist.adb.notify=0" # Disable ADB connection notification
    "ro.max.fling_velocity=18000" # Max swipe speed
    "ro.min.fling_velocity=12000" # Min swipe speed
    "debug.sf.hw=1" # Using hardware acceleration
    "ro.telephony.call_ring.delay=0"
    "ro.media.enc.jpeg.quality=100"
    "ro.audio.silent=0"
)


append_prop() {
    if ! sudo grep -q "${1}" "$BUILD_PROP"; then
        echo "[🟢] Adding prop '${1}' to "${2}""
        sudo sed -i "$ a ${1}" "$BUILD_PROP"
    else
        echo "[✔️] Prop '${1}' is already present in "${2}""
    fi
}


remove_prop() {
    if sudo grep -q "^${1}" "${2}"; then
        echo "[🔴] Removing prop '${1}' from "${2}""
        sudo sed -i "/^${1}/d" "${2}"
    else
        echo "[✔️] Prop '${1}' is not present in "${2}""
    fi
}


edit_prop() {
    prop_name="${1%%=*}"
    new_value="${1#*=}"
    if sudo grep -q "${prop_name}=" "${2}"; then
        current_value=$(sudo grep "^${prop_name}=" "${2}" | cut -d'=' -f2)
        if [ "$current_value" != "$new_value" ]; then
            echo "[🔵] Editing prop '${prop_name}' in "${2}""
            sudo sed -i "s/${prop_name}=.*/${prop_name}=${new_value}/" "${2}"
        else
            echo "[✔️] Prop '${prop_name}' already has the desired value (${new_value}) in "${2}""
        fi
    else
        echo "[✔️] Prop '${prop_name}' is not present in "${2}""
    fi
}


# TWEAKS SECTION


## BUILD.PROP
append_prop "# DebloatedMotoWeed build.prop tweaks"
for prop in "${ADD_PROP_LIST[@]}"; do
    append_prop "$prop" "${BUILD_PROP}"
done
