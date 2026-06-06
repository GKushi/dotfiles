#!/usr/bin/env bash
set -u

SESSION="work"

in_tmux=0
current_session=""

if tmux info >/dev/null 2>&1; then
  in_tmux=1
  current_session="$(tmux display-message -p '#S')"
fi

# Kill session if it already exists
tmux has-session -t "${SESSION}" 2>/dev/null && tmux kill-session -t "${SESSION}"

tmux new-session -d -s "${SESSION}" -c "${HOME}" -n code
tmux new-window -t "${SESSION}:" -c "${HOME}" -n monitor
tmux new-window -t "${SESSION}:" -c "${HOME}" -n misc
tmux new-window -t "${SESSION}:" -c "${HOME}/Documents" -n docs
tmux select-window -t "${SESSION}:1"

if [ "${in_tmux}" -eq 1 ]; then
  tmux switch-client -t "${SESSION}"
  if [ -n "${current_session}" ] && [ "${current_session}" != "${SESSION}" ]; then
    tmux kill-session -t "${current_session}" 2>/dev/null || true
  fi
else
  tmux attach -t "${SESSION}"
fi
