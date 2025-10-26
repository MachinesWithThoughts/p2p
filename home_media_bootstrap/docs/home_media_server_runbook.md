# 🧩 Home Media Server Runbook (Static IP NFS Volume + Auto .env Refresh)

## 🗺️ Overview
Fully automated, portable Docker stack that mounts NAS directly using NFS via static IP (192.168.1.52).
Each startup regenerates the `.env` file automatically, ensuring correct configuration every time.

---

# ⚙️ Configuration

### `.env` Auto-Generated Each Startup
```bash
NAS_IP=192.168.1.52
HOST_MEDIA_BASE=/mnt/p2p
```

### NFS on NAS
Ensure `/etc/exports` includes:
```bash
/mnt/md0/p2p *(rw,sync,no_root_squash,no_subtree_check)
```
Restart NFS:
```bash
systemctl restart nfs-server
```

---

# 🍎 macOS / 🐧 Linux / 🪟 WSL2

## Regular Tasks
```bash
./scripts/startup-macos.sh
./scripts/shutdown-macos.sh
```

### Behavior
- Ensures Docker Desktop is running
- Waits for daemon readiness
- Pulls test image to confirm API
- Refreshes `.env` file every time
- Starts NFS-mounted containers via static IP

---

# ✅ Summary
- Portable across all platforms
- Headless & self-healing startup
- No stale environment issues
- Fully automated `.env` refresh
