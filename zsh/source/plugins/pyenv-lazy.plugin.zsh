# See https://github.com/davidparsson/zsh-pyenv-lazy

# Try to find pyenv, if it's not on the path
export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
if ! type pyenv >/dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# Lazy load pyenv
if type pyenv >/dev/null; then
  function pyenv() {
    export PATH="${PYENV_ROOT}/shims:${PATH}"
    unset -f pyenv
    eval "$(command pyenv init -)"
    if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
      eval "$(command pyenv virtualenv-init -)"
    fi
    pyenv "$@"
  }
fi
