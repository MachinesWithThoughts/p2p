# 🧩 Home Media Server Runbook (SABnzbd /config Mount)

## Overview
This version updates SABnzbd to mount its NFS share directly to `/config` for proper compatibility
with the LinuxServer.io image. All downloads, logs, and admin data reside there.

### Mount summary
| Container | NAS Path | Mounted At |
|------------|-----------|-------------|
| nfs-mounter | /mnt/md0/p2p_sabnzbd | /mnt/p2p_sabnzbd |
| sabnzbd | /mnt/md0/p2p_sabnzbd | /config |
| sonarr | /mnt/md0/p2p_sonarr | /mnt/p2p |

---

## Restart Procedure
```bash
docker compose up -d --force-recreate sabnzbd
```
To verify:
```bash
docker exec -it sabnzbd ls /config
```
