#!/usr/bin/env bash

namespace=$(kv namespaces | fzf)
tmux set-option -p @kv_namespace "$namespace"
