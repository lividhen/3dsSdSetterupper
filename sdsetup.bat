@echo off

set /p "id0=ID0: "
set /p "id1=ID1: "

echo Downloading SafeB9SInstaller 0.0.7, boot9strap 1.4, and luma 3ds 11.0... 
echo.

curl -s https://api.github.com/repos/d0k3/SafeB9SInstaller/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./SafeB9SInstaller.zip -i -
curl -s https://api.github.com/repos/SciresM/boot9strap/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./boot9strap.zip -i -
curl -s https://api.github.com/repos/LumaTeam/Luma3DS/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Luma3DS.zip -i -
curl -LJO https://github.com/zoogie/unSAFE_MODE/releases/download/v1.3/usm.bin

cls
echo Place your DSIWARE_EXPLOIT.zip in the same directory as the script.
echo You can get it here: http://3dstools.nhnarwhal.com/#/bb3gen
echo.

pause

echo Extracting...

set sd=FilesInHere
mkdir %sd%

tar -xf Luma3DS.zip -C %CD%\%sd%\
del Luma3DS.zip

mkdir %CD%\%sd%\boot9strap
tar -xf boot9strap.zip -C %CD%\%sd%\boot9strap
del boot9strap.zip

tar -xf SafeB9SInstaller.zip -C %CD%\%sd% SafeB9SInstaller.bin
del SafeB9SInstaller.zip

tar -xf DSIWARE_EXPLOIT.zip
mkdir "%sd%\Nintendo 3DS"
mkdir "%sd%\Nintendo 3DS\%id0%"
mkdir "%sd%\Nintendo 3DS\%id0%\%id1%"
mkdir "%sd%\Nintendo 3DS\%id0%\%id1%\Nintendo DSiWare"
move F00D43D5.bin "%CD%\%sd%\Nintendo 3DS\%id0%\%id1%\Nintendo DSiWare\"
move usm.bin %CD%\%sd%


echo Part 2...
echo.


echo Downloading FBI (cia and 3dsx), Anemone, Checkpoint, Universal Updater, GodMode9, and the Homebrew Launcher Loader.
curl -s https://api.github.com/repos/astronautlevel2/Anemone3DS/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Anemone3DS.cia -i -
curl -s https://api.github.com/repos/FlagBrew/Checkpoint/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Checkpoint.cia -i -
curl -s https://api.github.com/repos/PabloMK7/homebrew_launcher_dummy/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Homebrew_Launcher.cia -i -
curl -s https://api.github.com/repos/Universal-Team/Universal-Updater/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./Universal-Updater.cia -i -
curl -s https://api.github.com/repos/Steveice10/FBI/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./FBI.3dsx -i -
curl -s https://api.github.com/repos/Steveice10/FBI/releases/latest | jq -r ".assets[1] | .browser_download_url" | wget -qO ./FBI.cia -i -
curl -s https://api.github.com/repos/d0k3/GodMode9/releases/latest | jq -r ".assets[0] | .browser_download_url" | wget -qO ./GodMode9.zip -i -

echo Moving Shtuffs...
echo.

mkdir %CD%\%sd%\cias
move *.cia %CD%\%sd%\cias\

mkdir %CD%\%sd%\3ds
move *.3ds  %CD%\%sd%\3ds\

mkdir %CD%\%sd%\luma
mkdir %CD%\%sd%\luma\payloads
tar -xf GodMode9.zip -C %CD%\%sd%\luma\payloads\ GodMode9.firm
del GodMode9.zip

cls

echo Opening explorer
explorer.exe %CD%\%sd%

echo Done! Plop everything here onto the sdcard root.
echo Make sure sd:\Nintendo 3DS\%id0%\%id1%\Nintendo DSiWare\ on your sd card is empty first!
pause
