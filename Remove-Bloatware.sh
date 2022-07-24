#!/bin/bash

# Remove bloadware from Onn. 4k streaming box
# Author: Amit Raut


# Dictionary of pre-installed bloatware apps

declare -A bw

bw['YouTube TV']='com.google.android.youtube.tv'
bw['Disney']='com.disney.disneyplus'
bw['HBO']='com.hbo.hbonow'
bw['YouTube Music']='com.google.android.youtube.tvmusic'
bw['HULU']='com.hulu.livingroomplus'
bw['Play Games']='com.google.android.play.games'
bw['Default TV Launcher']='com.google.android.tvlauncher'


for i in "${!bw[@]}"; do
    read -p "[?] Do you want remove \"$i\"? (y/n) " yn

    case $yn in
        y ) adb shell su -c pm uninstall --user 0 ${bw[$i]} > /dev/null && echo "[+] Removed $i." || echo "[!] Failed to remove $i. Already removed?";;
        n ) echo "[-] Keeping $i";;
    esac
done
