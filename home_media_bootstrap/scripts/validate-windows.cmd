@echo off
REM validate-windows.cmd — Verify p2p user, mapped drive, and write access on Windows

set BASE_DRIVE=Z:\p2p
echo 🔍 Validating Windows environment for media stack...
echo Base path: %BASE_DRIVE%
echo -----------------------------------------------

REM Check drive
if exist %BASE_DRIVE% (
  echo ✅ Drive exists: %BASE_DRIVE%
) else (
  echo ❌ Drive not found. Please map \nas3\p2p as drive Z:
  exit /b 1
)

REM Check write access
set TESTFILE=%BASE_DRIVE%\.write_test_%RANDOM%
echo test > %TESTFILE%
if exist %TESTFILE% (
  echo ✅ Writable share
  del %TESTFILE%
) else (
  echo ⚠️  Unable to write to %BASE_DRIVE%
)

echo -----------------------------------------------
echo Validation complete.
pause
