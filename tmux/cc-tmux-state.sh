#!/usr/bin/env bash
# Set a window-scoped tmux option reflecting Claude Code's state, so the
# statusline can render a per-window status dot. Driven by Claude Code hooks.
#
#   SessionStart     -> session-start (green, counter reset)
#   UserPromptSubmit -> working       (yellow)
#   PostToolUse      -> post-tool     (yellow; recovers from stuck red)
#   SubagentStart    -> subagent-start (yellow, counter++)
#   SubagentStop     -> subagent-stop  (yellow, counter--)
#   Stop             -> idle          (green, ONLY if no subagents in flight)
#   Notification     -> waiting       (red, minus the idle-nudge downgrade)
#   SessionEnd       -> clear         (dot removed)
#
# A fifth state, "seen" (white), is set by tmux pane-focus-in/out hooks in
# alabaster-theme.conf when the user focuses a window whose state is idle:
# green = done-and-unseen, white = done-and-acknowledged. This script never
# sets "seen"; it only avoids clobbering it in the idle-nudge path.
#
# Claude runs hooks inside the pane, so $TMUX_PANE is inherited. The option is
# set on the *window* containing that pane; `refresh-client -S` forces an
# immediate statusline redraw instead of waiting for status-interval.
#
# Why the counter: the main-agent `Stop` hook fires whenever a *turn* ends --
# including when the parent hands off to a BACKGROUND subagent and briefly has
# nothing to do. Without tracking in-flight subagents that reads as "done" and
# the dot goes green while the child is still working. @cc_subagents counts
# live subagents so `Stop` only goes green once it hits zero.
#
# Why `set-option -F` for the counter: hooks run concurrently (parallel
# subagent launches fire SubagentStart hooks simultaneously), so a client-side
# read-modify-write loses updates. Format arithmetic in `set-option -F` is
# evaluated inside the tmux server, which processes commands serially -- each
# increment/decrement is atomic by construction. If a hook is ever lost
# (crash) the counter can wedge; session-start and clear reset it, and
# post-tool keeps the colour truthful in the meantime.
#
# Why post-tool: Notification turns the dot red for a permission prompt, but
# approving the prompt fires no hook -- without PostToolUse the dot would stay
# red for the rest of the turn while Claude is clearly working.
#
# Usage: cc-tmux-state.sh <session-start|working|post-tool|subagent-start|
#                          subagent-stop|idle|waiting|clear>

state="${1:-idle}"

# Only act when running inside tmux.
[ -z "${TMUX:-}" ] && exit 0
[ -z "${TMUX_PANE:-}" ] && exit 0

# In-flight subagent count as a server-side format expression (unset -> 0).
CNT='#{?#{@cc_subagents},#{@cc_subagents},0}'
# `Stop` (and a downgraded idle nudge) only goes green when no subagent is
# still running; otherwise background work is ongoing -> stay yellow.
IDLE_OR_WORKING="#{?#{e|>:${CNT},0},working,idle}"

set_state() { tmux set-option -w -t "$TMUX_PANE" @cc_state "$1" 2>/dev/null; }

case "$state" in
  clear)
    # Leaving Claude: remove options so the window looks untouched again.
    tmux set-option -wu -t "$TMUX_PANE" @cc_state 2>/dev/null
    tmux set-option -wu -t "$TMUX_PANE" @cc_subagents 2>/dev/null
    ;;
  session-start)
    # Fresh session (startup / resume / clear): nothing in flight, Claude is
    # ready for input. Also heals a counter wedged by a lost hook.
    tmux set-option -w -t "$TMUX_PANE" @cc_subagents 0 2>/dev/null
    set_state idle
    ;;
  working|post-tool)
    # working = new human turn. post-tool = a tool call just completed, which
    # proves Claude is active again after a permission prompt (red) was
    # answered. Neither touches the counter: a background subagent launched
    # last turn is still in flight and must keep counting.
    set_state working
    ;;
  subagent-start)
    tmux set-option -wF -t "$TMUX_PANE" @cc_subagents "#{e|+:${CNT},1}" 2>/dev/null
    set_state working
    ;;
  subagent-stop)
    # Floor at 0 so a stray stop can't push the counter negative.
    tmux set-option -wF -t "$TMUX_PANE" @cc_subagents \
      "#{?#{e|>:${CNT},0},#{e|-:${CNT},1},0}" 2>/dev/null
    # Deliberately does NOT touch the colour. Mid-turn the dot is already
    # yellow (working/post-tool/subagent-start set it), and a straggler agent
    # stopping AFTER the session went idle must not repaint a green dot --
    # there is no later Stop to turn it back, so it would wedge yellow.
    ;;
  idle)
    tmux set-option -wF -t "$TMUX_PANE" @cc_state "$IDLE_OR_WORKING" 2>/dev/null
    ;;
  waiting)
    # The Notification hook fires both for a genuine attention request
    # (permission prompt / question) AND the idle nudge ("Claude is waiting
    # for your input"), which really means "done, your turn" -> green. The
    # payload's notification_type distinguishes them; the message substring is
    # kept as a fallback. Default to red on anything else needing attention.
    payload=""
    [ ! -t 0 ] && payload="$(cat)"
    case "$payload" in
      *idle_prompt*|*"waiting for your input"*)
        # Unlike Stop, the nudge is a re-announcement of an idle state the
        # user may have already acknowledged by focusing the window (tmux
        # focus hooks set @cc_state=seen) -- don't repaint green over that.
        # Likewise a red dot at nudge-time means a permission prompt is still
        # pending: keep it red. (If it was answered, the next PostToolUse or
        # Stop repaints, so preserving waiting can never wedge.)
        tmux set-option -wF -t "$TMUX_PANE" @cc_state \
          "#{?#{==:#{@cc_state},waiting},waiting,#{?#{e|>:${CNT},0},working,#{?#{==:#{@cc_state},seen},seen,idle}}}" 2>/dev/null
        ;;
      *auth_success*)
        ;; # not an attention request; leave the dot alone
      *)
        set_state waiting
        ;;
    esac
    ;;
  *)
    exit 0
    ;;
esac

tmux refresh-client -S 2>/dev/null

# Event trace for debugging surprise colour changes: which hook fired, when,
# from which pane/process. Per-user tmpdir (not shared /tmp), truncated when
# it grows past ~256KB. Harmless to keep; delete the file to reset.
log="${TMPDIR:-/tmp}/cc-tmux-state.log"
[ -f "$log" ] && [ "$(wc -c < "$log" 2>/dev/null || echo 0)" -gt 262144 ] && : > "$log"
printf '%s %s %-14s ppid=%s %.120s\n' "$(date '+%F %T')" "$TMUX_PANE" "$state" \
  "$PPID" "${payload:-}" >> "$log" 2>/dev/null

exit 0
