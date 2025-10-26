#!/bin/bash
# startup-linux.sh — Start Docker stack for Linux
set -e
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DOCKER_DIR="$BASE_DIR/docker"
ENV_FILE="$DOCKER_DIR/.env.linux"

echo "🚀 Starting Docker stack (Linux)..."
sudo systemctl start docker || true
if [ ! -f "$DOCKER_DIR/.env" ]; then
  cp "$ENV_FILE" "$DOCKER_DIR/.env"
fi
cd "$DOCKER_DIR"
docker compose up -d
docker compose ps
echo "✅ Docker stack started."
