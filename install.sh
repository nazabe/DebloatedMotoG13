DIR="unpacked"

echo "DebloatedMotoWeed Debug Installer"
echo "by DiabloSat"

fastboot erase system
fastboot erase system_ext
fastboot erase product

fastboot flash system "${DIR}/system_a.img"
fastboot flash system_ext "${DIR}/system_ext_a.img"
fastboot flash product "${DIR}/product_a.img"

fastboot -w

fastboot reboot
