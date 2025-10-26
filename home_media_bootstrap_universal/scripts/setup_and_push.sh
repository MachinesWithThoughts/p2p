#!/bin/bash
# Automated setup and Git push for the Home Media Bootstrap (universal version)

REPO_URL="git@github.com:MachinesWithThoughts/p2p.git"

echo "📦 Initializing git repository and pushing to $REPO_URL"

cd "$(dirname "$0")"/..

git init
git branch -M main
git remote add origin "$REPO_URL"
git add .
git commit -m "Initial media server bootstrap (universal compose)"
git push -u origin main

echo "✅ Repository pushed successfully to $REPO_URL"
