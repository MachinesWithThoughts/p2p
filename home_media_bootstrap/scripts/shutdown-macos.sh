#!/bin/bash
set -e
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DOCKER_DIR="$BASE_DIR/docker"

echo "🛑 Stopping Docker stack..."
cd "$DOCKER_DIR"
docker compose down
osascript -e 'quit app "Docker"'
echo "✅ Docker stack stopped."
