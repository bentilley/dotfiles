# zmodload zsh/zprof
# Variables
export EDITOR="vim"
export PAGER="less"
export LSCOLORS="Gxfxcxdxbxegedabagacad"
type firefox &>/dev/null && export BROWSER=firefox


# History configuration
export HISTSIZE=50000
export SAVEHIST=100000
export HISTFILE="$HOME/.config/zsh/.zsh_history"
setopt hist_find_no_dups      # find no dups when searching history
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete dups first when HISTFILE exceeds HISTSIZE

# set up zinit plugin manager (should be done before compinit)
source ~/.config/zsh/.zinit/bin/zinit.zsh
# See https://github.com/zdharma/zinit for details

# Set Options
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Basic auto/tab complete:
zstyle ':completion:*' menu select
zmodload zsh/complist
# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 
autoload -Uz compinit && compinit
_comp_options+=(globdots)		# Include hidden files.


# fzf
export FZF_DEFAULT_COMMAND='ag --nocolor -g .'

# macports
export MP_EDITOR_VISUAL=/usr/local/bin/vim

# pyenv
export ZSH_PYENV_LAZY_VIRTUALENV=true
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# autojump settings
[ -f /usr/local/etc/profile.d/autojump.sh  ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

# Alias for command substitution - easier than typing it
function var-subs () {
  LBUFFER="${LBUFFER}"'$()'
  zle backward-char
}
zle -N var-subs

# FZF history search
function fzf-history () {
  COMMAND="$(history | fzf --reverse --query=${LBUFFER} | sed -E -e 's/^\s*[0-9]+\s*//')"
  zle redisplay
  BUFFER=${COMMAND}
}
zle -N fzf-history

# key bindings
bindkey -v
bindkey -M vicmd "^V" edit-command-line
bindkey -M viins "^K" history-search-backward
bindkey -M viins "^J" history-search-forward
bindkey -M viins "^E" end-of-line
bindkey -M viins "^O" var-subs
bindkey -M viins "^R" history-incremental-search-backward
bindkey -M viins "^F" fzf-history
export KEYTIMEOUT=10

# source additional files
for additional_file in $HOME/.dotfiles/zsh/source/**/*.zsh; do
  source $additional_file
done

# source any secrets / api keys etc.
[ -f ~/.dotfiles/zsh/zsh_secrets ] && source ~/.dotfiles/zsh/zsh_secrets

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light davidparsson/zsh-pyenv-lazy
# zinit light zdharma/fast-syntax-highlighting
zinit snippet OMZP::git

# setup direnv - directory level variables
eval "$(direnv hook zsh)"

# setup starship prompt
eval "$(starship init zsh)"
# zprof
