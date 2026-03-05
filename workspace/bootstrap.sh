#!/usr/bin/env bash
# Bootstrap script — runs automatically on each container startup
# Enables all default tools for the main agent and fixes pairing/auth issues

set -euo pipefail

CONFIG_FILE="${OPENCLAW_STATE_DIR:-/data/.openclaw}/openclaw.json"

if [ -f "$CONFIG_FILE" ]; then
  echo "[bootstrap] Enabling all default tools for main agent..."

  # Enable all built-in tools for the main agent
  openclaw config set agents.main.tools.allow '["*"]' --json 2>/dev/null || true

  # Disable tool approval prompts (auto-approve all tool calls)
  openclaw config set agents.main.tools.requireApproval false 2>/dev/null || true

  # Fix allowInsecureAuth so Control UI connects without pairing prompts
  openclaw config set gateway.controlUi.allowInsecureAuth true 2>/dev/null || true

  echo "[bootstrap] All tools enabled. Approval prompts disabled."
else
  echo "[bootstrap] Config not found yet — skipping (will apply after first setup)."
fi

# Ensure workspace directories exist
mkdir -p "${OPENCLAW_WORKSPACE_DIR:-/data/workspace}"

echo "[bootstrap] Done."
