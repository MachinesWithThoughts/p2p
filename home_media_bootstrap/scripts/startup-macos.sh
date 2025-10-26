#!/bin/bash
# startup-macos.sh — Start Docker stack for macOS
set -e
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DOCKER_DIR="$BASE_DIR/docker"
ENV_FILE="$DOCKER_DIR/.env.macos"

echo "🚀 Starting Docker stack (macOS)..."

if ! pgrep -f Docker >/dev/null; then
  echo "🐳 Launching Docker Desktop..."
  open -a Docker
  while ! docker system info >/dev/null 2>&1; do sleep 2; done
fi

if [ ! -f "$DOCKER_DIR/.env" ]; then
  cp "$ENV_FILE" "$DOCKER_DIR/.env"
fi

cd "$DOCKER_DIR"
docker compose up -d
docker compose ps
echo "✅ Docker stack started."
