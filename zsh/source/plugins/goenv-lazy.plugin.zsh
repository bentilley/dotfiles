# See https://github.com/kadaan/zsh-goenv-lazy

export GOENV_ROOT="${GOENV_ROOT:=${HOME}/.goenv}"
pathprepend "${GOENV_ROOT}/shims"

# Lazy load goenv
if type goenv &>/dev/null; then
  # Activate ZSH completion script.
  source "$(dirname "$(readlink -f "$(which goenv)")")/../completions/goenv.zsh"

  # Setup goenv command.
  function goenv() {
    unset -f goenv >/dev/null 2>&1
    eval "$(command goenv init -)"
    goenv "$@"
  }
fi
