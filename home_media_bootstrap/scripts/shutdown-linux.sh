#!/bin/bash
# shutdown-linux.sh — Stop Docker stack for Linux
set -e
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DOCKER_DIR="$BASE_DIR/docker"

echo "🛑 Stopping Docker stack (Linux)..."
cd "$DOCKER_DIR"
docker compose down
sudo systemctl stop docker || true
echo "✅ Docker stack stopped."
