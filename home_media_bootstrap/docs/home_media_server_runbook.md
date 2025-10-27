# 🧩 Home Media Server Runbook (with NFS-Mounter Integration)

## Overview
This setup adds a dedicated `nfs-mounter` container to mount and maintain all NFS shares before starting SABnzbd and Sonarr.

### NFS-Mounter Tasks
- Mounts `/mnt/md0/p2p`, `/mnt/md0/p2p_sabnzbd`, and `/mnt/md0/p2p_sonarr`
- Verifies mounts are active
- Keeps mounts persistent with `tail -f /dev/null`

### Usage
```bash
./scripts/startup-macos.sh
```
- Verifies NFS exports on NAS
- Starts `nfs-mounter`
- Waits for mounts
- Starts app containers (SABnzbd, Sonarr)

Check mounts:
```bash
docker exec -it nfs-mounter mount | grep /mnt
```

Expected output:
```
192.168.1.52:/mnt/md0/p2p_sabnzbd on /mnt/p2p_sabnzbd type nfs ...
192.168.1.52:/mnt/md0/p2p_sonarr on /mnt/p2p_sonarr type nfs ...
192.168.1.52:/mnt/md0/p2p on /mnt/p2p type nfs ...
```
