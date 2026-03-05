#!/usr/bin/env bash
# Bootstrap script — runs on every container startup before the gateway
# Fixes allowInsecureAuth so the Control UI connects without pairing prompts

set -euo pipefail

CONFIG_FILE="${OPENCLAW_STATE_DIR:-/data/.openclaw}/openclaw.json"

if [ -f "$CONFIG_FILE" ]; then
  echo "[bootstrap] Ensuring allowInsecureAuth is enabled in config..."
  # Use openclaw config set to enable allowInsecureAuth
  openclaw config set gateway.controlUi.allowInsecureAuth true 2>/dev/null || true
  echo "[bootstrap] allowInsecureAuth set. Pairing prompts disabled."
else
  echo "[bootstrap] Config not found yet — skipping (will apply after first setup)."
fi

# Ensure workspace directories exist
mkdir -p "${OPENCLAW_WORKSPACE_DIR:-/data/workspace}"

echo "[bootstrap] Done."
