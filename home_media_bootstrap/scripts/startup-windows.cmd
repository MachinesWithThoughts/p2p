@echo off
REM startup-windows.cmd — Start Docker stack for Windows
set BASEDIR=%~dp0..
set DOCKERDIR=%BASEDIR%\docker
set ENVFILE=%DOCKERDIR%\.env.windows

echo 🚀 Starting Docker stack (Windows)...

IF NOT EXIST "%DOCKERDIR%\.env" (
  copy "%ENVFILE%" "%DOCKERDIR%\.env"
)

cd /d "%DOCKERDIR%"
docker compose up -d
docker compose ps
echo ✅ Docker stack started.
pause
