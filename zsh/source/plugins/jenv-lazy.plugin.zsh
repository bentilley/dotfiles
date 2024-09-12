# Try to find jenv, if it's not on the path
export JENV_ROOT="${JENV_ROOT:=${HOME}/.jenv}"

# Lazy load jenv
if type jenv >/dev/null; then
  function jenv() {
    unset -f jenv
    eval "$(command jenv init -)"
    jenv "$@"
  }
fi
