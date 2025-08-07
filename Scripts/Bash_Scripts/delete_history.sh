#!/usr/bin/env bash
#
# cleanhistory.sh
#
# Remove every Bash-history entry that contains a given keyword.
#
# Usage (must be sourced, not executed):
#   . ./cleanhistory.sh <keyword>
#
# Safeguard: if the keyword is only 1 character long,
#            prompt for confirmation before proceeding.

# ──────────────────────────────────────────────────────────────────────────────
# 1) Prevent running as a standalone script (must be sourced).
#───────────────────────────────────────────────────────────────────────────────
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "Please run this script by sourcing it, e.g.:"
  echo "    . \"${0}\" <keyword>"
  exit 1
fi

# ──────────────────────────────────────────────────────────────────────────────
# 2) Check argument count
#───────────────────────────────────────────────────────────────────────────────
if [[ $# -ne 1 ]]; then
  echo "Usage: . \"${BASH_SOURCE[0]}\" <keyword>"
  return 1
fi

keyword="$1"

# ──────────────────────────────────────────────────────────────────────────────
# 3) Safeguard against overly short keywords
#───────────────────────────────────────────────────────────────────────────────
min_length=2

if [[ ${#keyword} -lt $min_length ]]; then
  # One-character (or empty) keyword → warn and request confirmation.
  echo "⚠️  Warning: You supplied a keyword of length ${#keyword}."
  echo "    Single-character (or empty) keywords will match A LOT of history lines."
  read -r -p "    Are you sure you want to proceed and delete every entry containing “$keyword”? [y/N] " answer
  case "$answer" in
    [Yy] )
      echo "Proceeding with keyword: “$keyword”";;
    * )
      echo "Aborted. No changes have been made."
      return 1
      ;;
  esac
fi

# ──────────────────────────────────────────────────────────────────────────────
# 4) Delete matching lines from current session’s history
#───────────────────────────────────────────────────────────────────────────────
# - `history` prints: “<event_num>  <command>”
# - grep -F "$keyword" finds every line containing the literal keyword.
# - awk '{print $1}' extracts just the event number.
# - sort -rn ensures we delete highest‐numbered entries first.
# - xargs -r -n1 history -d {} runs “history -d <event_num>” for each.
history | grep -F "$keyword" \
       | awk '{print $1}' \
       | sort -rn \
       | xargs -r -n1 history -d

# ──────────────────────────────────────────────────────────────────────────────
# 5) Write the cleaned in-memory history back to ~/.bash_history
#───────────────────────────────────────────────────────────────────────────────
history -w

# ──────────────────────────────────────────────────────────────────────────────
# 6) Also strip those same lines from the history file on disk
#───────────────────────────────────────────────────────────────────────────────
grep -vF "$keyword" "$HOME/.bash_history" > "$HOME/.bash_history.tmp" \
  && mv "$HOME/.bash_history.tmp" "$HOME/.bash_history"

# ──────────────────────────────────────────────────────────────────────────────
# 7) Reload the (now‐clean) ~/.bash_history into your current shell session
#───────────────────────────────────────────────────────────────────────────────
history -c
history -r

echo "➤ All history entries containing “$keyword” have been removed."

