@echo off
:: ================================================================
:: Hone Gaming Optimizer - One-Click Launcher for Windows
:: ================================================================
title Hone Gaming Optimizer
color 0E

cd /d "%~dp0"

:: 1. Immediately launch the graphical Hone UI in default web browser
echo [HONE] Launching Hone UI Dashboard in default browser...
start "" "preview.html"

:: 2. Check for Administrator Privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [HONE] Requesting Administrator Privileges for Windows optimizations...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:: 3. Launch HoneOptimizer engine
if exist "HoneOptimizer.exe" (
    echo [HONE] Starting HoneOptimizer.exe native engine...
    "HoneOptimizer.exe"
) else if exist "scripts\Hone_Tweaks.ps1" (
    echo [HONE] Starting PowerShell optimization backend...
    powershell -ExecutionPolicy Bypass -File "scripts\Hone_Tweaks.ps1" -Action God
) else (
    echo [HONE] Opening Hone web dashboard...
    start "" "preview.html"
)

echo.
echo ================================================================
echo Hone Optimizer session finished. Press any key to exit.
echo ================================================================
pause
