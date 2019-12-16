# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# path additions for macports
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export EDITOR="vim"
export PAGER="less"

# path for ruby - added because brew told me
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# paths for zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# path for helm 2.16.1 (old helm)
export PATH="/usr/local/opt/helm@2/bin:$PATH"

# for installing python better with homebrew
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# some homebrew formulae put executables in local/sbin
export PATH="/usr/local/sbin:$PATH"

# mysql version 5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

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
export FLUX_FORWARD_NAMESPACE=weave

# fzf
export FZF_DEFAULT_COMMAND='ag --nocolor -g .'

# MACPORTS
export MP_EDITOR_VISUAL=/usr/local/bin/vim
