# See https://github.com/kadaan/zsh-rbenv-lazy

# Lazy load rbenv
if type rbenv &> /dev/null; then
  local RBENV_SHIMS="${RBENV_ROOT:-${HOME}/.rbenv}/shims"
  export PATH="${RBENV_SHIMS}:${PATH}"
  source $(dirname $(greadlink -f `whence -p rbenv`))/../completions/rbenv.zsh
  function rbenv() {
    unset -f rbenv > /dev/null 2>&1
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi
