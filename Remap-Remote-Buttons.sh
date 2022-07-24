#!/bin/bash

# Remap remote for Onn. 4k streaming box
# Author: Amit Raut

# Push the onntvremap directory to /sdcard/Download/
echo "[+] Pushing onntvremap directory to downloads"
adb push onntvremap/ /sdcard/Download/

# move the onntvremap directory to /data/adb/modules/ as root user
echo "[+] Moving onntvremap directory to /data/adb/modules"
adb shell "su -c mv /sdcard/Download/onntvremap /data/adb/modules/"

echo "[+] Use button mapper and grant superuser access to remap the remote keys as per your liking"
 
echo "[+] Rebooting..."
adb reboot
