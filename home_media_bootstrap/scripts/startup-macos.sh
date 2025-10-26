#!/bin/bash
set -e
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DOCKER_DIR="$BASE_DIR/docker"
ENV_FILE="$DOCKER_DIR/.env.macos"

echo "🚀 Starting Docker stack (NFS volume mode using static NAS IP)..."

# Ensure Docker Desktop is running
if ! pgrep -f Docker >/dev/null; then
  echo "🐳 Launching Docker Desktop..."
  open -a Docker
fi

# Wait for Docker daemon readiness
echo "⏳ Waiting for Docker daemon to become responsive..."
until docker info >/dev/null 2>&1; do
  sleep 2
done
echo "✅ Docker daemon is responding."

# Test Docker API availability
echo "🔍 Verifying Docker image pull API..."
until docker pull busybox:latest >/dev/null 2>&1; do
  echo "   Waiting for Docker API to accept image pulls..."
  sleep 3
done
echo "✅ Docker image pull works."

# Always refresh environment file
echo "🔧 Refreshing environment file..."
cp "$ENV_FILE" "$DOCKER_DIR/.env"

# Start the stack
cd "$DOCKER_DIR"
echo "🚀 Launching containers with NFS volume mount (static IP)..."
docker compose up -d --remove-orphans
docker compose ps
echo "✅ Docker stack started successfully."
