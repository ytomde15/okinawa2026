@echo off
REM Restore Okinawa trip plan files from GitHub.
REM Run this if the folder contents are lost.

echo ============================================
echo  Okinawa Trip Plan - Restore from GitHub
echo ============================================
echo.

where git >nul 2>nul
if errorlevel 1 (
    echo [ERROR] git is not installed or not in PATH.
    pause
    exit /b 1
)

cd /d "%~dp0"

if exist ".git" (
    echo Existing repository found. Pulling latest...
    git fetch origin
    git reset --hard origin/main
) else (
    echo Cloning from GitHub...
    git init -b main
    git remote add origin https://github.com/ytomde15/okinawa2026.git
    git fetch origin
    git reset --hard origin/main
    git branch --set-upstream-to=origin/main main
)

echo.
echo Done. Files restored.
echo Site URL: https://ytomde15.github.io/okinawa2026/
echo.
echo NOTE: To push updates, ask ClaudeCode to re-configure authentication.
echo.
pause
