@echo off

set /p "id0=ID0: "
set /p "id1=ID1: "

echo Downloading SafeB9SInstaller 0.0.7, boot9strap 1.4, and luma 3ds 11.0... 
echo.

curl -LJO "https://github.com/d0k3/SafeB9SInstaller/releases/download/v0.0.7/SafeB9SInstaller-20170605-122940.zip"
curl -LJO "https://github.com/SciresM/boot9strap/releases/download/1.4/boot9strap-1.4.zip"
curl -LJO "https://github.com/LumaTeam/Luma3DS/releases/download/v11.0/Luma3DSv11.0.zip"

cls
echo Place your unSAFE_MODE.zip in the same directory as the script.
echo You can get it here: https://3ds.nhnarwhal.com/3dstools/unsafemode.php
echo.

pause

echo Extracting...

set sd=FilesInHere
mkdir %sd%

tar -xf Luma3DSv11.0.zip -C %CD%\%sd%\
del Luma3DSv11.0.zip

mkdir %CD%\%sd%\boot9strap
tar -xf boot9strap-1.4.zip -C %CD%\%sd%\boot9strap
del boot9strap-1.4.zip

tar -xf SafeB9SInstaller-20170605-122940.zip -C %CD%\%sd% SafeB9SInstaller.bin
del SafeB9SInstaller-20170605-122940.zip

tar -xf unSAFE_MODE.zip
mkdir "%sd%\Nintendo 3DS"
mkdir "%sd%\Nintendo 3DS\%id0%"
mkdir "%sd%\Nintendo 3DS\%id0%\%id1%"
mkdir "%sd%\Nintendo 3DS\%id0%\%id1%\Nintendo DSiWare"
move F00D43D5.bin "%CD%\%sd%\Nintendo 3DS\%id0%\%id1%\Nintendo DSiWare\"
move usm.bin %CD%\%sd%


echo Part 2...
echo.


echo Downloading FBI (cia and 3dsx), Anemone, Checkpoint, Universal Updater, GodMode9, and the Homebrew Launcher Loader.
curl -LJO "https://github.com/astronautlevel2/Anemone3DS/releases/download/v2.3.1/Anemone3DS.cia"
curl -LJO "https://github.com/FlagBrew/Checkpoint/releases/download/v3.7.4/Checkpoint.cia"
curl -LJO "https://github.com/PabloMK7/homebrew_launcher_dummy/releases/download/v1.0/Homebrew_Launcher.cia"
curl -LJO "https://github.com/Universal-Team/Universal-Updater/releases/download/v3.2.5/Universal-Updater.cia"
curl -LJO "https://github.com/Steveice10/FBI/releases/download/2.6.1/FBI.cia"
curl -LJO "https://github.com/Steveice10/FBI/releases/download/2.6.1/FBI.3dsx"
curl -LJO "https://github.com/d0k3/GodMode9/releases/download/v2.1.1/GodMode9-v2.1.1-20220322194259.zip"

echo Moving Shtuffs...
echo.

mkdir %CD%\%sd%\cias
move *.cia %CD%\%sd%\cias\

mkdir %CD%\%sd%\3ds
move *.3ds  %CD%\%sd%\3ds\

mkdir %CD%\%sd%\luma
mkdir %CD%\%sd%\luma\payloads
tar -xf GodMode9-v2.1.1-20220322194259.zip -C %CD%\%sd%\luma\payloads\ GodMode9.firm
del GodMode9-v2.1.1-20220322194259.zip

cls

echo Opening explorer
explorer.exe %CD%\%sd%

echo Done! Plop everything here onto the sdcard root.
echo Make sure sd:\Nintendo 3DS\%id0%\%id1%\Nintendo DSiWare\ on your sd card is empty first!
pause