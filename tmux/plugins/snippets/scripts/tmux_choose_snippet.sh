#!/usr/bin/env bash

namespace=$(tmux show-options -pqv @kv_namespace)
if [[ -z "$namespace" ]]; then
  namespace=default
fi

keys=$(
  KV_NAMESPACE="$namespace" kv ls --table |
    fzf \
      --exact \
      --nth=1 \
      --bind 'enter:become(echo {2})' \
      --bind 'one:become(echo {2})' \
      --prompt "namespace:$namespace > "
)
tmux send-keys "$keys"