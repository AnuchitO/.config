#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/.env"

SSID="${ANUCHITO_VIRUS_SSID}"
PASS="${ANUCHITO_VIRUS_PASS}"
DEVICE="en0"

if [ -z "$PASS" ]; then
  echo "❌ Password not found in Keychain for SSID: $SSID"
  exit 1
fi

echo "🔐 Connecting to $SSID..."
networksetup -setairportnetwork "$DEVICE" "$SSID" "$PASS"

