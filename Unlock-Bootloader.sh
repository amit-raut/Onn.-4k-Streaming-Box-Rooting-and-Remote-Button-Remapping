#!/bin/bash

# Unlock Bootloader on android devices
# Author: Amit Raut

st=$(adb devices -l | grep "device" | grep "product:") 

if [[ $? != 0 ]]; then
  echo "No device connected. Please connect the device to proceed to unlocking android device."
  exit 1
fi
echo "[+] Attempting to unlock the bootloader using fastboot. Please wait..."

adb reboot bootloader
sleep 30
fastboot devices
fastboot flashing unlock
if [[ $? != 0 ]]; then
    echo "[!] Device bootloader unlocking unsuccessful. Please try again."
    exit 1
fi
echo "[+] Device bootloader unlocking successful. Rebooting..."
sleep 3
fastboot reboot

