if [[ -z $TMUX ]]; then
  # Personal bin
  export PATH="$HOME/.dotfiles/bin:$PATH"

  # Haskell
  export PATH="$PATH:$HOME/.local/bin"  # Haskell stack packages
  [ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && \
    source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

  # Rust
  export PATH="$HOME/.cargo/bin:$PATH"

  if [[ "$(uname)" == "Darwin" ]] && [[ "$(whoami)" == "MrSquee" ]]; then
    source ~/.dotfiles/zsh/zshenv-personal-mac
  fi

  if [[ "$(uname)" == "Linux" ]]; then
    source ~/.dotfiles/zsh/zshenv-work-linux
  fi
fi
