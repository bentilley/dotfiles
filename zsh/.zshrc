# zmodload zsh/zprof

# Variables
export SHELL="zsh"
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export PAGER="less"
export LSCOLORS="ExfxcxdxCxegedabagacad"
type firefox &>/dev/null && export BROWSER=firefox

# less colours -- since man uses less as a pager, this gives us
# coloured man pages
export LESS_TERMCAP_mb=$'\E[01;10m'          # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;177m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'              # end mode
export LESS_TERMCAP_so=$'\E[38;5;0;48;5;11m' # begin standout-mode - info box
export LESS_TERMCAP_se=$'\E[0m'              # end standout-mode
export LESS_TERMCAP_us=$'\E[04;38;5;128m'    # begin underline
export LESS_TERMCAP_ue=$'\E[0m'              # end underline

# Support ANSI color sequences, truncate lines (don't wrap), and use
# smart case search (rather than case sensitive).
# https://stackoverflow.com/a/26069/509706
export LESS=-RSi

# History configuration
export HISTSIZE=50000
export SAVEHIST=100000
export HISTFILE="$HOME/.config/zsh/.zsh_history"
# setopt share_history          # share history across multiple shells
setopt inc_append_history     # append to history file as you go, not on exit
setopt hist_find_no_dups      # find no dups when searching history
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete dups first when HISTFILE exceeds HISTSIZE

# Set Options
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# fpath
fpath=(~/.dotfiles/zsh/completions $fpath)
fpath=(~/.dotfiles/zsh/lib/funcs $fpath)
autoload -Uz $fpath[1]/*(.:t) # autoload func directory

# set up zinit plugin manager (should be done before compinit)
#source ~/.config/zsh/.zinit/bin/zinit.zsh
declare -A ZINIT
ZINIT[NO_ALIASES]=1 # don't set zi / zini aliases
source ~/.local/share/zinit/zinit.git/zinit.zsh
# See https://github.com/zdharma/zinit for details

# Basic auto/tab complete:
zstyle ':completion:*' menu select
zmodload zsh/complist
# case insensitive path-completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix 
autoload -Uz compinit && compinit
_comp_options+=(globdots) # Include hidden files.

# Personal bin
pathprepend "$HOME/.dotfiles/bin"

# fzf
export FZF_DEFAULT_COMMAND='rg --color=never --files-with-matches .'

# direnv
export DIRENV_WARN_TIMEOUT='10s'

# macports
export MP_EDITOR_VISUAL="nvim"

# pyenv
export ZSH_PYENV_LAZY_VIRTUALENV=true
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Alias for command substitution - easier than typing it
function var-subs() {
  LBUFFER="${LBUFFER}"'$()'
  zle backward-char
}
zle -N var-subs

# FZF history search
function fzf-history() {
  COMMAND="$(history 1 | fzf --reverse --query=${LBUFFER} | sed -E -e 's/^\s*[0-9]+\s*//')"
  zle redisplay
  LBUFFER=${COMMAND}
}
zle -N fzf-history

# FZF history search
function fzf-history-uniq() {
  COMMAND="$(history -n 1 | sort | uniq | fzf --reverse --query=${LBUFFER})"
  zle redisplay
  LBUFFER=${COMMAND}
}
zle -N fzf-history-uniq

# Edit command line in vim widget
autoload -z edit-command-line
zle -N edit-command-line

# key bindings
bindkey -v
bindkey -M vicmd "^V" edit-command-line
bindkey -M viins "^K" history-beginning-search-backward
bindkey -M viins "^J" history-beginning-search-forward
bindkey -M viins "^A" beginning-of-line
bindkey -M viins "^E" end-of-line
bindkey -M viins "^O" var-subs
bindkey -M viins "^R" history-incremental-search-backward
bindkey -M viins "^F" fzf-history
bindkey -M viins "^T" fzf-history-uniq
export KEYTIMEOUT=10

# source custom local machine path
source "${HOME}/.local/share/zsh/path.zsh"

# source additional files - source the machine specific files first as they
# might set env variable options that are used in the other files.
for additional_file in $HOME/.local/share/zsh/source/**/*.zsh; do
  source $additional_file
done
for additional_file in $HOME/.dotfiles/zsh/source/**/*.zsh; do
  source $additional_file
done

# source any secrets / api keys etc.
[ -f ~/.dotfiles/zsh/secrets ] && source ~/.dotfiles/zsh/secrets

# rust
[ ! -z $CARGO_HOME ] && source "$CARGO_HOME/env"

# ocaml
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" >/dev/null 2>&1

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light mroth/evalcache
zinit snippet OMZP::git

# setup direnv - directory level variables
_evalcache direnv hook zsh

# setup starship prompt
_evalcache starship init zsh

# setup zoxide - directory jump
_evalcache zoxide init zsh

# zprof
