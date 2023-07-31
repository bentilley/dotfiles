# See https://github.com/kadaan/zsh-goenv-lazy

# Lazy load goenv
if type goenv &> /dev/null; then
  local GOENV_SHIMS="${GOENV_ROOT:-${HOME}/.goenv}/shims"
  export PATH="${GOENV_SHIMS}:${PATH}"
  source $(dirname $(greadlink -f `whence -p goenv`))/../completions/goenv.zsh
  function goenv() {
    unset -f goenv > /dev/null 2>&1
    eval "$(command goenv init -)"
    goenv "$@"
  }
fi
