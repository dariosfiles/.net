@echo off
title Dario's Fortnite Trace Cleaner
echo WARNING: ONLY USE THIS AFTER PC WIPE / RESTART AND WITH FORTNITE NOT INSTALLED
echo THIS IS NOT USED AS A CLEANER, BUT TO PREVENT FORTNITE FROM DETECTING IP CHANGE FOR IP BANS, ETC...
echo.
echo Press any key to continue.
pause >nul
cls
:: Check for admin privileges
>nul 2>&1 net session
if %errorlevel% neq 0 (
    echo Please run cmd as an administrator before using this script.
    pause >nul
    exit /b
)

:: Ask user for confirmation
set /p userChoice="Do you want to start system cleanup? (Y/N): "
if /I "%userChoice%" NEQ "Y" (
    echo Operation cancelled.
    pause
    exit /b
)

echo.
echo === Starting System Cleanup ===

echo Cleaning temporary files...
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1

echo Flushing DNS and resetting network config...
ipconfig /flushdns >nul
ipconfig /release >nul
ipconfig /renew >nul
netsh winsock reset >nul
netsh int ip reset >nul

echo Clearing event logs...
for /F "tokens=*" %%G in ('wevtutil el') DO wevtutil cl "%%G" >nul 2>&1

echo Removing recent files and prefetch...
del /F /Q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1
del /F /Q C:\Windows\Prefetch\* >nul 2>&1

cls

echo.
echo === Cleanup Complete ===
echo Press any key to restart the system...
pause >nul
shutdown /r /t 0
