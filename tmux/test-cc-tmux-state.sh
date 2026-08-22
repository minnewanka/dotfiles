#!/usr/bin/env bash
# Test suite for cc-tmux-state.sh. Runs against a throwaway tmux window so
# live sessions are untouched. Must run from inside tmux (the script under
# test silently no-ops otherwise).
#
# Usage: test-cc-tmux-state.sh [/path/to/cc-tmux-state.sh]

set -u
S="${1:-"$(cd "$(dirname "$0")" && pwd)/cc-tmux-state.sh"}"
fail=0

if [ -z "${TMUX:-}" ]; then
  echo "ERROR: must run inside tmux (cc-tmux-state.sh no-ops without \$TMUX)" >&2
  exit 2
fi

# Throwaway window; its first pane is our victim.
win="$(tmux new-window -dP -F '#{window_id}' 'sleep 300')"
pane="$(tmux list-panes -t "$win" -F '#{pane_id}' | head -1)"
trap 'tmux kill-window -t "$win" 2>/dev/null' EXIT

run() { TMUX_PANE="$pane" "$S" "$@"; }
state() { tmux show-options -wqv -t "$pane" @cc_state; }
count() { tmux show-options -wqv -t "$pane" @cc_subagents; }

check() { # check <label> <expected> <actual>
  if [ "$2" = "$3" ]; then
    echo "ok   $1"
  else
    echo "FAIL $1: expected [$2] got [$3]"
    fail=1
  fi
}

echo "--- basic transitions ---"
run working </dev/null
check "working sets state"        "working" "$(state)"
run idle </dev/null
check "idle with no subagents"    "idle"    "$(state)"

echo "--- subagent counting ---"
run working </dev/null
run subagent-start </dev/null
run subagent-start </dev/null
check "two starts count=2"        "2"       "$(count)"
run idle </dev/null
check "stop while in flight stays working" "working" "$(state)"
run subagent-stop </dev/null
run subagent-stop </dev/null
check "two stops count=0"         "0"       "$(count)"
run idle </dev/null
check "idle after drain"          "idle"    "$(state)"

echo "--- concurrency: 8 parallel starts, then 8 parallel stops ---"
run working </dev/null
for i in $(seq 8); do run subagent-start </dev/null & done; wait
check "8 parallel starts count=8" "8"       "$(count)"
for i in $(seq 8); do run subagent-stop </dev/null & done; wait
check "8 parallel stops count=0"  "0"       "$(count)"

echo "--- notification payloads ---"
run working </dev/null
echo '{"notification_type":"idle_prompt","message":"Claude is waiting for your input"}' | run waiting
check "idle nudge downgrades to idle" "idle" "$(state)"
run working </dev/null
echo '{"message":"Claude is waiting for your input"}' | run waiting
check "message-substring fallback (no type field) downgrades too" "idle" "$(state)"
run working </dev/null
echo '{"notification_type":"permission_prompt","message":"Claude needs your permission to use Bash"}' | run waiting
check "permission prompt goes waiting" "waiting" "$(state)"
echo '{"notification_type":"auth_success","message":"Authentication successful"}' | run waiting
check "auth_success leaves waiting alone" "waiting" "$(state)"
run working </dev/null
echo '{"notification_type":"auth_success","message":"Authentication successful"}' | run waiting
check "auth_success leaves working alone" "working" "$(state)"
run subagent-start </dev/null
echo '{"notification_type":"idle_prompt","message":"Claude is waiting for your input"}' | run waiting
check "idle nudge with subagents in flight stays working" "working" "$(state)"
run subagent-stop </dev/null

echo "--- pending permission survives the idle nudge ---"
run working </dev/null
echo '{"notification_type":"permission_prompt","message":"x"}' | run waiting
echo '{"notification_type":"idle_prompt","message":"Claude is waiting for your input"}' | run waiting
check "idle nudge does not clear pending prompt" "waiting" "$(state)"

echo "--- post-tool self-heal (stuck-red fix) ---"
run post-tool </dev/null
check "post-tool clears waiting back to working" "working" "$(state)"

echo "--- session-start resets ---"
run subagent-start </dev/null
run session-start </dev/null
check "session-start zeroes counter" "0"    "$(count)"
check "session-start state idle"     "idle" "$(state)"

echo "--- cross-turn background agent not forgotten ---"
run working </dev/null
run subagent-start </dev/null
run working </dev/null       # new user prompt while bg agent in flight
check "new prompt keeps in-flight count" "1" "$(count)"
run idle </dev/null
check "stop stays working (bg agent alive)" "working" "$(state)"
run subagent-stop </dev/null

echo "--- seen (focus-acknowledged) interactions ---"
run idle </dev/null
tmux set-option -w -t "$pane" @cc_state seen   # simulate focus hook
echo '{"notification_type":"idle_prompt","message":"Claude is waiting for your input"}' | run waiting
check "idle nudge preserves seen" "seen" "$(state)"
run working </dev/null
run idle </dev/null
check "next turn repaints green over seen" "idle" "$(state)"

echo "--- straggler subagent-stop after idle must not repaint the dot ---"
run subagent-stop </dev/null   # background agent stopped AFTER session went idle
check "straggler stop keeps idle/green" "idle" "$(state)"
run subagent-start </dev/null
run subagent-stop </dev/null   # mid-turn stop: state already working, must stay
check "mid-turn stop keeps working" "working" "$(state)"

echo "--- clear ---"
run clear </dev/null
check "clear unsets state" "" "$(state)"
check "clear unsets count" "" "$(count)"

exit $fail
