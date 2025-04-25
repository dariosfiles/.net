:: Hi lil filthy boy i dont care if u skid this, but good luck skidding the loader tho
:: If you have to skid this then ur just fucking down bad
:: Learn how to code lil bro
@echo off
title Dario's Fortnite Trace Cleaner
color 0A

echo ============================================================================
echo  DARIO'S FORTNITE TRACE CLEANER
echo ============================================================================
echo WARNING: ONLY USE THIS AFTER A PC WIPE / RESTART AND WITHOUT FORTNITE INSTALLED
echo PURPOSE: Prevent Fortnite from tracking IP / device for bans etc.
echo Discord: https://discord.gg/a8v3Emj9dZ
echo ============================================================================

pause >nul
cls

>nul 2>&1 net session
if %errorlevel% neq 0 (
    echo [!] Please run this script as administrator - Press any key to close.
    echo [*] Reason: Flushing DNS and other file related stuff need admin to run.
    pause >nul
    exit /b
)

set /p userChoice="Do you want to start system cleanup? (Y/N): "
if /I "%userChoice%" NEQ "Y" (
    echo Operation cancelled.
    pause
    exit /b
)

cls
echo === Starting System Cleanup ===

del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1

ipconfig /flushdns >nul
ipconfig /release >nul
ipconfig /renew >nul
netsh winsock reset >nul
netsh int ip reset >nul

for /F "tokens=*" %%G in ('wevtutil el') DO wevtutil cl "%%G" >nul 2>&1

del /f /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1
del /f /q C:\Windows\Prefetch\* >nul 2>&1

if exist "%LOCALAPPDATA%\FortniteGame" rd /s /q "%LOCALAPPDATA%\FortniteGame"
if exist "%APPDATA%\Epic" rd /s /q "%APPDATA%\Epic"
if exist "%LOCALAPPDATA%\EpicGamesLauncher" rd /s /q "%LOCALAPPDATA%\EpicGamesLauncher"
if exist "%PROGRAMDATA%\Epic" rd /s /q "%PROGRAMDATA%\Epic"
if exist "%USERPROFILE%\AppData\Local\UnrealEngine" rd /s /q "%USERPROFILE%\AppData\Local\UnrealEngine"
if exist "%USERPROFILE%\AppData\Roaming\Unreal Engine" rd /s /q "%USERPROFILE%\AppData\Roaming\Unreal Engine"
if exist "%USERPROFILE%\Documents\Unreal Projects" rd /s /q "%USERPROFILE%\Documents\Unreal Projects"
if exist "C:\Program Files\Epic Games" rd /s /q "C:\Program Files\Epic Games"
if exist "D:\Epic Games" rd /s /q "D:\Epic Games"

reg delete "HKCU\Software\Epic Games" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\EpicGames" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Epic Games" /f >nul 2>&1
reg delete "HKCU\Software\Unreal Engine" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\EpicGamesLauncher" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\Fortnite" /f >nul 2>&1

schtasks /delete /tn "EpicGamesLauncher*" /f >nul 2>&1

del /f /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*" >nul 2>&1
del /f /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*" >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1

del /f /q "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Epic Games Launcher.lnk" >nul 2>&1
del /f /q "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Epic Games Launcher.lnk" >nul 2>&1

echo.
echo === CLEANUP COMPLETE ===
echo Press any key to restart...
pause >nul

set script="%~f0"
(
    echo @echo off
    echo timeout /t 2 >nul
    echo del %script%
) > "%TEMP%\tralalerotralala.bat"
start "" /min "%TEMP%\tralalerotralala.bat"

shutdown /r /t 0
