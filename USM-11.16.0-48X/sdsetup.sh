#!/bin/bash

read -p 'ido=' ID0
read -p 'id1=' ID1

echo Downloading SafeB9SInstaller 0.0.7, boot9strap 1.4, and luma 3ds 11.0...
echo

curl -s https://api.github.com/repos/d0k3/SafeB9SInstaller/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./SafeB9SInstaller.zip -i -
curl -s https://api.github.com/repos/SciresM/boot9strap/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./boot9strap.zip -i -
curl -s https://api.github.com/repos/LumaTeam/Luma3DS/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Luma3DS.zip -i -
curl -LJO https://github.com/zoogie/unSAFE_MODE/releases/download/v1.3/usm.bin

clear
echo Place your DSIWARE_EXPLOIT.zip in the same directory as the script.
echo You can get it here: http://3dstools.nhnarwhal.com/#/bb3gen
echo

read -p 'press enter to continue'

echo Extracting...

SD=FilesInHere
mkdir $SD

unzip Luma3DS.zip -d ./$SD/
rm Luma3DS.zip
$PWD
mkdir ./$SD/boot9strap
unzip boot9strap.zip -d ./$SD/boot9strap
rm boot9strap.zip

unzip SafeB9SInstaller.zip SafeB9SInstaller.bin -d ./$SD
rm SafeB9SInstaller.zip

unzip DSIWARE_EXPLOIT.zip
mkdir "./$SD/Nintendo 3DS"
mkdir "./$SD/Nintendo 3DS/$ID0"
mkdir "./$SD/Nintendo 3DS/$ID0/$ID1"
mkdir "./$SD/Nintendo 3DS/$ID0/$ID1/Nintendo DSiWare"
mv F00D43D5.bin "./$SD/Nintendo 3DS/$ID0/$ID1/Nintendo DSiWare/"
mv usm.bin ./$SD


echo Part 2...
echo


echo 'Downloading FBI (cia and 3dsx), Anemone, Checkpoint, Universal Updater, GodMode9, and the Homebrew Launcher Loader.'
curl -s https://api.github.com/repos/astronautlevel2/Anemone3DS/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Anemone3DS.cia -i -
curl -s https://api.github.com/repos/FlagBrew/Checkpoint/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Checkpoint.cia -i -
curl -s https://api.github.com/repos/PabloMK7/homebrew_launcher_dummy/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Homebrew_Launcher.cia -i -
curl -s https://api.github.com/repos/Universal-Team/Universal-Updater/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Universal-Updater.cia -i -
curl -s https://api.github.com/repos/Steveice10/FBI/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./FBI.3dsx -i -
curl -s https://api.github.com/repos/Steveice10/FBI/releases/latest | jq -r ".assets[1] | .browser_download_url" | wget -qO ./FBI.cia -i -
curl -s https://api.github.com/repos/d0k3/GodMode9/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./GodMode9.zip -i -

echo Moving Shtuffs...
echo

mkdir ./$SD/cias
mv *.cia ./$SD/cias/

mkdir ./$SD/3ds
mv *.3dsx  ./$SD/3ds/

mkdir ./$SD/luma
mkdir ./$SD/luma/payloads
unzip GodMode9.zip GodMode9.firm -d ./$SD/luma/payloads/
rm GodMode9.zip

#clear

echo Opening explorer
xdg-open ./$SD

echo Done! Plop everything here onto the sdcard root.
echo Make sure sd:/Nintendo 3DS/$ID0/$ID1/Nintendo DSiWare/ on your sd card is empty first!
read -p 'press enter to continue'
