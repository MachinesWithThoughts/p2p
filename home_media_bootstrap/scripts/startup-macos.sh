#!/bin/bash
set -e
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DOCKER_DIR="$BASE_DIR/docker"
ENV_FILE="$DOCKER_DIR/.env.macos"

echo "🚀 Starting Docker stack (NFS mounter integration)..."

if ! pgrep -f Docker >/dev/null; then
  echo "🐳 Launching Docker Desktop..."
  open -a Docker
fi

echo "⏳ Waiting for Docker daemon to become responsive..."
until docker info >/dev/null 2>&1; do
  sleep 2
done
echo "✅ Docker daemon is responding."

# Preflight NFS check
source "$ENV_FILE"
echo "🔍 Checking NFS exports on ${NAS_IP}..."
if ! showmount -e ${NAS_IP} >/dev/null 2>&1; then
  echo "❌ Cannot reach NAS at ${NAS_IP}. Exiting."
  exit 1
fi
echo "✅ NAS exports are reachable."

echo "🔧 Refreshing environment file..."
cp "$ENV_FILE" "$DOCKER_DIR/.env"

cd "$DOCKER_DIR"
echo "🚀 Launching NFS mounter first..."
docker compose up -d nfs-mounter

echo "⏳ Waiting for NFS mounter to complete setup..."
sleep 8
docker logs nfs-mounter || true

echo "🚀 Launching SABnzbd and Sonarr..."
docker compose up -d sabnzbd sonarr
docker compose ps
echo "✅ Docker stack started successfully with nfs-mounter."
