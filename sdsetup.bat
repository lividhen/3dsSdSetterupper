@echo off
set /p "id0=ID0: "
set /p "id1=ID1: "

echo Downloading SafeB9SInstaller, boot9strap, and luma 3ds... 
echo.

for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/d0k3/SafeB9SInstaller/releases/latest ^| find "browser_download_url"') do (curl -kL -o SafeB9SInstaller.zip  %%B)
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/SciresM/boot9strap/releases/releases/latest ^| find "browser_download_url"') do (curl -kL -o boot9strap.zip  %%B)
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/LumaTeam/Luma3DS/releases/latest ^| find "browser_download_url"') do (curl -kL -o Luma3DS.zip  %%B)
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
move bb3.bin %CD%\%sd%
move usm.bin %CD%\%sd%


echo Part 2...
echo.


echo Downloading FBI (cia and 3dsx), Anemone, Checkpoint, Universal Updater, GodMode9, and the Homebrew Launcher Loader.
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/astronautlevel2/Anemone3DS/releases/latest ^| find "browser_download_url"') do (curl -kL -o Anemone3DS.cia  %%B)
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/FlagBrew/Checkpoint/releases/latest ^| find "browser_download_url"') do (curl -kL -o Checkpoint.cia  %%B)
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/PabloMK7/homebrew_launcher_dummy/releases/latest ^| find "browser_download_url"') do (curl -kL -o Homebrew_Launcher.cia  %%B)
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/Universal-Team/Universal-Updater/releases/latest ^| find "browser_download_url"') do (curl -kL -o Universal-Updater.cia  %%B)
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/Steveice10/FBI/releases/latest ^| find "browser_download_url"') do (curl -kL -o FBI.zip  %%B)
tar -xvf FBI.zip 3ds-arm/3ds/FBI/FBI.3dsx
tar -xvf FBI.zip 3ds-arm/FBI.cia -C %CD%
del FBI.zip
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/d0k3/GodMode9/releases/latest ^| find "browser_download_url"') do (curl -kL -o GodMode9.zip  %%B)
echo Moving Shtuffs...
echo.

mkdir %CD%\%sd%\cias
move *.cia %CD%\%sd%\cias\
move %CD%\%sd%\3ds-arm\FBI.cia %CD%\%sd%\3ds\

mkdir %CD%\%sd%\3ds
move %CD%\3ds-arm\3ds\FBI\FBI.3dsx  %CD%\%sd%\3ds\

rmdir /S %CD%\3ds-arm

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
