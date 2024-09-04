# Try to find renv, if it's not on the path
export RENV_ROOT="${RENV_ROOT:=${HOME}/.renv}"
pathprepend "${RENV_ROOT}/shims"

if ! type renv >/dev/null && [ -f "${RENV_ROOT}/bin/renv" ]; then
  pathappend "${RENV_ROOT}/bin"
fi

# Lazy load renv
if type renv >/dev/null; then
  function renv() {
    unset -f renv
    eval "$(command renv init - | sed '/shims/d')"
    renv "$@"
  }
fi
