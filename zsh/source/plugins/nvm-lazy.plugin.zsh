# See https://github.com/undg/zsh-nvm-lazy-load

# Create wrappers around common nvm consumers.
# nvm, node, yarn and npm will load nvm.sh on their first invocation,
# posing no start up time penalty for the shells that aren't going to use them at all.
# There is only single time penalty for one shell.

load-nvm() {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
}

diagnostic-languageserver() {
    unset -f diagnostic-languageserver
    load-nvm
    diagnostic-languageserver "$@"
}

nvm() {
    unset -f nvm
    load-nvm
    nvm "$@"
}

node() {
    unset -f node
    load-nvm
    node "$@"
}

npm() {
    unset -f npm
    load-nvm
    npm "$@"
}

yarn() {
    unset -f yarn
    load-nvm
    yarn "$@"
}
