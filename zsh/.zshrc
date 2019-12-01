# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# path additions for macports
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export EDITOR='vim'

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
export ZSH="$HOME/.oh-my-zsh"

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
# COMPLETION_WAITING_DOTS="true"

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
  git
  web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# set up 'pure' theme
autoload -U promptinit; promptinit
prompt pure
# set up kubectl prompt
source ~/.dotfiles/zsh/prompt/kube-ps1.sh
PROMPT='$(kube_ps1) '$PROMPT
KUBE_PS1_SEPARATOR='| '
kubeoff -g

# ADD-ONS
source ~/.dotfiles/zsh/.iterm2_shell_integration.zsh # iTerm2 shell integration
source ~/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# variables
export FZF_DEFAULT_COMMAND='ag --nocolor -g .'

# MACPORTS
export MP_EDITOR_VISUAL=/usr/local/bin/vim

# gcloud Settings
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
export CLOUDSDK_PYTHON='/usr/local/bin/python2'

# autojump settings
[ -f /usr/local/etc/profile.d/autojump.sh  ] && . /usr/local/etc/profile.d/autojump.sh

# AUTH FOR F13
export HASH_AUTH_OVERRIDE=YmVudGlsbGV5OnUmWC1kciFjNGcK

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Ingresso
export FLUX_FORWARD_NAMESPACE=weave

# History configuration
export HISTSIZE=50000
export SAVEHIST=100000
setopt HIST_FIND_NO_DUPS

# key bindings
bindkey -v
bindkey -M vicmd "^V" edit-command-line
bindkey -M viins "^K" history-search-backward
bindkey -M viins "^J" history-search-forward
bindkey -M viins "^E" end-of-line
export KEYTIMEOUT=1

# source additional files
for additional_file in $HOME/.dotfiles/zsh/source/**/*.zsh; do
  source $additional_file
done

# setup direnv - directory level variables
eval "$(direnv hook zsh)"
export HOMEBREW_GITHUB_API_TOKEN=f1f95e47db14d0f3e0d35d200241784472fac444
