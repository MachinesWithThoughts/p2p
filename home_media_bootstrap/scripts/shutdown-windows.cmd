@echo off
REM shutdown-windows.cmd — Stop Docker stack for Windows
set BASEDIR=%~dp0..
set DOCKERDIR=%BASEDIR%\docker

echo 🛑 Stopping Docker stack (Windows)...
cd /d "%DOCKERDIR%"
docker compose down
echo ✅ Docker stack stopped.
pause
