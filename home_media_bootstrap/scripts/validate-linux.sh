#!/bin/bash
# validate-linux.sh — Verify p2p user, group, and NAS mount on Linux

BASE_PATH="${1:-/mnt/p2p}"
EXPECTED_UID=2000
EXPECTED_GID=2000
USER_NAME="p2p"
GROUP_NAME="p2p"

echo "🔍 Validating Linux environment for media stack..."
echo "Base path: $BASE_PATH"
echo "-----------------------------------------------"

# User check
if id "$USER_NAME" &>/dev/null; then
  ACTUAL_UID=$(id -u "$USER_NAME")
  [ "$ACTUAL_UID" -eq "$EXPECTED_UID" ] && echo "✅ User '$USER_NAME' UID $EXPECTED_UID" || echo "⚠️ UID mismatch: $ACTUAL_UID"
else
  echo "❌ User '$USER_NAME' missing"
fi

# Group check
if getent group "$GROUP_NAME" &>/dev/null; then
  ACTUAL_GID=$(getent group "$GROUP_NAME" | cut -d: -f3)
  [ "$ACTUAL_GID" -eq "$EXPECTED_GID" ] && echo "✅ Group '$GROUP_NAME' GID $EXPECTED_GID" || echo "⚠️ GID mismatch: $ACTUAL_GID"
else
  echo "❌ Group '$GROUP_NAME' missing"
fi

# Mount check
mountpoint -q "$BASE_PATH" && echo "✅ Mount exists: $BASE_PATH" || { echo "❌ Mount missing"; exit 1; }

# Write test
TESTFILE="$BASE_PATH/.write_test_$$"
if sudo -u "$USER_NAME" touch "$TESTFILE" &>/dev/null; then
  echo "✅ Writable by $USER_NAME"
  rm -f "$TESTFILE"
else
  echo "⚠️ Not writable by $USER_NAME"
fi

echo "-----------------------------------------------"
echo "Validation complete."
