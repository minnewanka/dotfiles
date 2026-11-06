#!/bin/bash
# Daily note: prefix + N. Reuses the `notes` session and one window per day.

set -uo pipefail

NOTES_DIR="${NOTES_DIR:-$HOME/notes}"
SESSION="notes"
TODAY="$(date +%Y-%m-%d)"
FILE="${NOTES_DIR}/${TODAY}.md"

mkdir -p "${NOTES_DIR}"

# Scaffold today's note once, so it never opens empty.
if [ ! -f "${FILE}" ]; then
  printf '# %s\n\n## todo\n\n- \n\n## notes\n\n' "$(date '+%A, %d %B %Y')" > "${FILE}"
fi

tmux has-session -t="${SESSION}" 2>/dev/null ||
  tmux new-session -d -s "${SESSION}" -c "${NOTES_DIR}" -n shell

# One window per day: jump to it if it is already open, otherwise start nvim.
tmux select-window -t "${SESSION}:=${TODAY}" 2>/dev/null ||
  tmux new-window -t "${SESSION}:" -n "${TODAY}" -c "${NOTES_DIR}" "nvim '${FILE}'"

if [ -n "${TMUX:-}" ]; then
  tmux switch-client -t "${SESSION}"
else
  tmux attach-session -t "${SESSION}"
fi
