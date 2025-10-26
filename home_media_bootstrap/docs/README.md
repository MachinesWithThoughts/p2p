# Home Media Server — Cross-Platform Startup/Shutdown Scripts

## macOS
- `startup-macos.sh` → Starts Docker Desktop and brings up the stack.
- `shutdown-macos.sh` → Stops the stack and quits Docker Desktop.

## Linux
- `startup-linux.sh` → Starts Docker service and stack.
- `shutdown-linux.sh` → Stops stack and Docker service.

## Windows
- `startup-windows.cmd` → Starts Docker Desktop stack.
- `shutdown-windows.cmd` → Stops stack.

Use these scripts from the `scripts/` directory:
```bash
./startup-macos.sh
./shutdown-macos.sh
```
