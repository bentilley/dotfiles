export EDITOR="vim"
export PAGER="less"

# path for ruby - added because brew told me
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# paths for zlib
if [ -d /usr/local/opt/zlib ]; then
  export LDFLAGS="-L/usr/local/opt/zlib/lib"
  export CPPFLAGS="-I/usr/local/opt/zlib/include"
  export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/.oh-my-zsh"

# AUTH FOR F13
export HASH_AUTH_OVERRIDE=YmVudGlsbGV5OnUmWC1kciFjNGcK

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Ingresso
export FLUX_FORWARD_NAMESPACE="flux"

# fzf
export FZF_DEFAULT_COMMAND='ag --nocolor -g .'

# MACPORTS
export MP_EDITOR_VISUAL=/usr/local/bin/vim
