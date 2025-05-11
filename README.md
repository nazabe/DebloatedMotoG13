# DebloatedMotoG13
Custom firmware A14 without bloatware for penangf (Moto G13/G23), based on stock.

## Features
- Removed Motorola bloatware software (even those that could not be removed manually).
- Removed pre-installation of all the bloatware from Google (if we need it, we'll install it manually, right?).
- Magisk pre-installed

## Manually build
- Install dependecies
```shell
sudo apt install android-sdk-platform-tools
sudo apt install android-sdk-libsparse-utils
```
- Move image super.img to the root project directory (Only if is not the UHA34.29-10)
- Run the ```build.sh``` script to modify the firmware 
```shell
sudo ./build.sh super.img 
```
- Install via script in fastbootd mode to test the modified firmware
```shell
./install.sh
```

## Debloat via ADB
There it still some apps that can be removed via adb shell
```shell
adb shell pm uninstall -k --user 0 com.google.android.calendar
adb shell pm uninstall -k --user 0 com.google.android.apps.googleassistant
adb shell pm uninstall -k --user 0 com.android.fmradio  
```

## How to install GCam
To do this you have to enable Camera2 API. You can do it via install the MagiskHide Props Config module in Magisk and doing this on Termux:
```
su
props
```
Select 5 for Add/edit custom props and write: persist.camera.HAL3.enabled. Then set 1 for enable and the "both boot stages" option.