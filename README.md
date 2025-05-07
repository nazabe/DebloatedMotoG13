# DebloatedMotoWeed
Custom firmware A14 without bloatware for penangf (Moto G13/G23), based on stock.

## Features
- Removed Motorola bloatware software (even those that could not be removed manually).
- Removed pre-installation of all the bloatware from Google (if we need it, we'll install it manually, right?).
- Magisk pre-installed

## Manually build
- Install dependecies (Debian linux distros)
  ```shell
  sudo apt install android-sdk-platform-tools
  sudo apt install android-sdk-libsparse-utils
  ```
- Move image super.img to the root project directory (Only if is not the UHA34.29-10)
- Run the ```build.sh``` script to modify the firmware 
```shell
./build.sh super.img
```
- Install via script in fastbootd mode to test the modified firmware
```shell
./install.sh
```
