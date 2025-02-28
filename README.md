# DebloatedMotoWeed
Custom firmware A14 without bloatware for penangf (Moto G13/G23), based on stock.

## Features
- Removed Motorola bloatware software (even those that could not be removed manually).
- Removed pre-installation of all the bloatware from Google (if we need it, we'll install it manually, right?).
- Magisk pre-installed
- Heavy applications have been replaced with alternatives **[In the process...]**

| Stock | DebloatedMotoWeed  |
| ----- | ------------------ |
| Moto Launcher | Lawnchair  |
| Gapps | MicroG             |
| YouTube | YouTube ReVanced |

## Manually build
- Install dependecies
  ```shell
  sudo pacman -S android-tools
  ```
- Move image super.img to the root project directory
- Run the ```build.sh``` script to modify the firmware 
```shell
./build.sh super.img
```
- Install via script in fastbootd mode to test the modified firmware
```shell
./install.sh
```
