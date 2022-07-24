#!/bin/bash

# Get root on Onn. 4k streaming box with Magisk
# Author: Amit Raut

# Get dopinder firmware

echo "[+] Downloading dopinder firmware. Please wait..."
# wget https://download.ods.ninja/Android/firmware/dopinder/dopinder-qt.20210519-factory.zip -O dopinder.zip

if [[ $(md5sum dopinder.zip) != '08fa86ced3da6c50aafe8395fce27fe9' ]]; then
    echo "[!] Firmware hash missmatch. Please make sure you're flashing with correct firmware";
fi

echo "[+] Extracting firmware"
unzip -d firmware dopinder.zip

# Get latest Magisk APK (latest version 25.2 as of 24th July 2022)
echo "[+] Downloading Magisk APK. Please wait..."
wget "https://github.com/topjohnwu/Magisk/releases/download/v25.2/Magisk-v25.2.apk" -O magisk.apk 2>&1


# Push the boot.img and magisk.apk to Onn 4k streaming box
echo "[+] Pushing boot.img and magisk on Onn. 4k streaming box in /sdcard/Downloads/";

adb push firmware/dopinder-qt.20210519-factory/boot.img /sdcard/Download/;
adb push magisk.apk /sdcard/Download/;

