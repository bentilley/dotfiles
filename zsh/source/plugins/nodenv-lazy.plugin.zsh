# setup NODENV_ROOT if it's not already done
export NODENV_ROOT="${NODENV_ROOT:=${HOME}/.nodenv}"

# Lazy load nodenv
if type nodenv &>/dev/null; then
  # source $(dirname $(greadlink -f $(whence -p nodenv)))/../completions/nodenv.zsh
  function nodenv() {
    unset -f nodenv >/dev/null 2>&1
    eval "$(command nodenv init -)"
    nodenv "$@"
  }
fi
