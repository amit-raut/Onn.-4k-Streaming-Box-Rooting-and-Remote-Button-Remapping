#!/bin/bash

# Get Root on Onn. 4k streaming box
# Author: Amit Raut

st=$(adb devices -l | grep "device" | grep "product:") 

if [[ $? != 0 ]]; then
  echo "No device connected. Please connect the device to proceed to unlocking android device."
  exit 1
fi

# Get the patched boot.img file from Downloads folder
adb pull /sdcard/Download/$(adb shell ls /sdcard/Download/ | grep magisk_patch) ./magisk-boot.img


adb reboot bootloader
echo "[+] Attempting to flash with patched 'boot.img' file. Please wait..."
fastboot flash boot magisk-boot.img
if [[ $? != 0 ]]; then
    echo "[!] Failed to flash device with patched image. Please try again."
fi

echo "[+] Flashed device with patched image. Should provide us with root access. Rebooting..."
fastboot reboot

sleep 30
echo "[+] Waiting for device to come back on to verify root access."
echo "[+] Grant root access to Shell when prompted" 

if [[ $(adb shell "su -c whoami") == "root" ]]; then
    echo "[+] Root access comfirmed :)"
fi

