# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "sorin" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bgnotify
  git
  web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# I think this is enabled in OMZ
# # Basic auto/tab complete:
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)		# Include hidden files.

type firefox &>/dev/null && export BROWSER=firefox

# ADD-ONS
source ~/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
# if [[ -f ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
#   source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# else
#   printf "No syntax highlighting add on!\n"
#   printf "run 'cd ~/.config/zsh && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git'"
# fi

# Haskell
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# pyenv
export PATH="/home/ben/.pyenv/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# autojump settings
[ -f /usr/local/etc/profile.d/autojump.sh  ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

# History configuration
export HISTSIZE=50000
export SAVEHIST=100000
setopt HIST_FIND_NO_DUPS

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

# setup direnv - directory level variables
eval "$(direnv hook zsh)"

# setup starship prompt
eval "$(starship init zsh)"
