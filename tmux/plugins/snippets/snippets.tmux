#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux bind-key i display-popup -EE "$CURRENT_DIR/scripts/tmux_choose_snippet.sh"
tmux bind-key C-i display-popup -EE "$CURRENT_DIR/scripts/tmux_choose_pane_namespace.sh"
