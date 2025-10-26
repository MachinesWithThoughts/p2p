#!/bin/bash
# setup_and_push.sh — Initialize Git repo and push bootstrap

REPO_URL="git@github.com:YOUR_USERNAME/p2p.git"
echo "📦 Initializing Git repository..."
cd "$(dirname "$0")"/..

git init
git branch -M main
git remote add origin "$REPO_URL"
git add .
git commit -m "Bootstrap commit: Universal + Validation scripts"
git push -u origin main

echo "✅ Repository pushed to $REPO_URL"
