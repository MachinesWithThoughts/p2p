# 🧩 Home Media Server Runbook (Shared p2p Mounts)

## Overview
This version mounts the shared `/mnt/md0/p2p` NFS export into **all containers**, ensuring both SABnzbd
and Sonarr have access to completed downloads and media folders.

### Mount summary
| Container | NAS Path | Mounted At |
|------------|-----------|-------------|
| nfs-mounter | /mnt/md0/p2p | /mnt/p2p |
| nfs-mounter | /mnt/md0/p2p_sabnzbd | /mnt/p2p_sabnzbd |
| nfs-mounter | /mnt/md0/p2p_sonarr | /mnt/p2p_sonarr |
| sabnzbd | /mnt/md0/p2p_sabnzbd | /config |
| sabnzbd | /mnt/md0/p2p | /mnt/p2p |
| sonarr | /mnt/md0/p2p_sonarr | /config |
| sonarr | /mnt/md0/p2p | /mnt/p2p |

---

## Restart Procedure
```bash
docker compose up -d --force-recreate
```
To verify:
```bash
docker exec -it sabnzbd mount | grep /mnt
docker exec -it sonarr mount | grep /mnt
```
You should see `/mnt/p2p` and respective `/config` mounts from the NAS.

---

## Benefits
- Shared `/mnt/p2p` volume simplifies coordination between SABnzbd and Sonarr
- Consistent NFS mount strategy across all containers
- Retains independent `/config` NFS-backed volumes for app data
