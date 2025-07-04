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
command -v fzf >/dev/null && source <(fzf --zsh)

# direnv
export DIRENV_WARN_TIMEOUT='10s'

# macports
export MP_EDITOR_VISUAL="nvim"

# pyenv
export ZSH_PYENV_LAZY_VIRTUALENV=true
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# source custom local machine path
[ -f "${HOME}/.local/share/zsh/path.zsh" ] && source "${HOME}/.local/share/zsh/path.zsh"

# source additional files - source the machine specific files first as they
# might set env variable options that are used in the other files.
for additional_file in $HOME/.local/share/zsh/source/**/*.zsh; do
  source $additional_file
done
for additional_file in $HOME/.dotfiles/zsh/source/**/*.zsh; do
  source "$additional_file"
done

# rust
[ ! -z $CARGO_HOME ] && source "$CARGO_HOME/env"

# ocaml
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" >/dev/null 2>&1

# Plugins
source "$HOME/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.local/share/zsh/hooks/direnv.zsh"
source "$HOME/.local/share/zsh/hooks/starship.zsh"
source "$HOME/.local/share/zsh/hooks/zoxide.zsh"

# _evalcache direnv hook zsh          # setup direnv - directory level variables
# _evalcache starship init zsh        # setup starship prompt
# _evalcache zoxide init zsh --no-cmd # setup zoxide - directory jump

# zprof
