#!/bin/bash

# Install useful apps on Androiod Tv 
# Author: Amit Raut


# Dictionary of useful apps to be installed on Android Tv

declare -A bw

bw['SmartTubeNext']='https://github.com/yuliskov/SmartTubeNext/releases/download/14.96/STubeNext_stbeta_v14.96_r.apk'


for i in "${!bw[@]}"; do
    read -p "[?] Do you want install \"$i\"? (y/n) " yn

    case $yn in
        y ) wget -q ${bw[$i]} -O $i.apk > /dev/null && adb install $i.apk > /dev/null && echo "[+] Installed $i." || echo "[!] Failed to install $i. Please try again.";;
        n ) echo "[-] Keeping $i";;
    esac
done
