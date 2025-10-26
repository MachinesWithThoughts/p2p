#!/bin/bash
# p2p-init-dirs.sh — Create directory structure for media stack

BASE_PATH="${1:-/mnt/p2p}"

echo "📂 Initializing media directory structure at: $BASE_PATH"

DIRS=(
  "$BASE_PATH/apps/sabnzbd/downloads"
  "$BASE_PATH/apps/sabnzbd/incomplete"
  "$BASE_PATH/apps/sonarr"
  "$BASE_PATH/config/plex"
  "$BASE_PATH/config/sabnzbd"
  "$BASE_PATH/config/sonarr"
  "$BASE_PATH/tv2"
  "$BASE_PATH/movies"
  "$BASE_PATH/documents"
  "$BASE_PATH/backup/configs"
  "$BASE_PATH/backup/media"
  "$BASE_PATH/backup/logs"
)

for dir in "${DIRS[@]}"; do
  mkdir -p "$dir"
  chmod 775 "$dir"
  echo "✅ Created $dir"
done

if id "p2p" &>/dev/null; then
  chown -R p2p:p2p "$BASE_PATH"
  echo "👤 Ownership set to p2p:2000"
else
  echo "⚠️  User 'p2p' not found — skipping chown. Please create it if needed."
fi

echo "🎉 Directory initialization complete!"
