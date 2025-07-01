# Edit command line in vim widget
autoload -z edit-command-line
zle -N edit-command-line

# Alias for command substitution - easier than typing it
function var-subs() {
  LBUFFER="${LBUFFER}"'$()'
  zle backward-char
}
zle -N var-subs

function _print_all_panes() {
  for pane_id in $(tmux list-panes -F '#{pane_id}'); do
    tmux capture-pane -p -J -S 0 -E - -t "$pane_id" |
      tr ' ' '\n' |
      sort -u |
      rg '[a-zA-Z0-9]+'
  done
}

function tmux-visible-autocomplete() {
  local current_word="${LBUFFER##* }"
  local new_rbuffer="${RBUFFER/#[^ ]##/}"
  local prompt="${LBUFFER% *} ␣ $new_rbuffer "

  local selected_word
  selected_word="$(
    _print_all_panes |
      fzf \
        --query="$current_word" \
        --prompt="$prompt" \
        --height=20 \
        --layout=reverse \
        --no-sort \
        --print-query |
      tail -n1
  )"
  local new_lbuffer="${LBUFFER% *} $selected_word"
  BUFFER="$new_lbuffer$new_rbuffer"
  CURSOR="${#new_lbuffer}"

  zle redisplay
}
zle -N tmux-visible-autocomplete

# key bindings
bindkey -v
bindkey -M vicmd "^V" edit-command-line
bindkey -M viins "^A" beginning-of-line
bindkey -M viins '^B' tmux-visible-autocomplete
bindkey -M viins "^E" end-of-line
bindkey -M viins "^J" history-beginning-search-forward
bindkey -M viins "^K" history-beginning-search-backward
bindkey -M viins "^O" var-subs
bindkey -M viins "^P" push-line
export KEYTIMEOUT=10
