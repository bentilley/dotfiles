# See https://github.com/davidparsson/zsh-pyenv-lazy

export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
pathprepend "${PYENV_ROOT}/shims"

# Try to find pyenv, if it's not on the path
if ! type pyenv >/dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
  pathappend "${PYENV_ROOT}/bin"
fi

# Lazy load pyenv
if type pyenv >/dev/null; then
  function pyenv() {
    unset -f pyenv
    eval "$(command pyenv init --no-push-path -)"
    if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
      eval "$(command pyenv virtualenv-init -)"
    fi
    pyenv "$@"
  }
fi
