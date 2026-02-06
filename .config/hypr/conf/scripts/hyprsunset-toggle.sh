#!/usr/bin/env bash
set -euo pipefail

STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}"
STATE_FILE="$STATE_DIR/hyprsunset.enabled"
mkdir -p "$STATE_DIR"

# Ensure hyprsunset is running
pgrep -x hyprsunset >/dev/null 2>&1 || (hyprsunset >/dev/null 2>&1 & disown || true)

if [[ -f "$STATE_FILE" ]]; then
  # OFF: disable blue-light filter + restore brightness
  hyprctl hyprsunset identity
  hyprctl hyprsunset gamma 100
  rm -f "$STATE_FILE"
else
  # ON: warmer + slightly dimmer (tweak to taste)
  hyprctl hyprsunset temperature 3500
  hyprctl hyprsunset gamma 85
  : > "$STATE_FILE"
fi

