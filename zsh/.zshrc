# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# path additions for macports
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# path for ruby - added because brew told me
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

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

# ADD-ONS
source ~/.dotfiles/zsh/.iterm2_shell_integration.zsh # iTerm2 shell integration
source ~/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# variables
export FZF_DEFAULT_COMMAND='ag --nocolor -g .'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jammy/Code/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jammy/Code/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/jammy/Code/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jammy/Code/google-cloud-sdk/completion.zsh.inc'; fi

# MACPORTS
export MP_EDITOR_VISUAL=/usr/local/bin/vim

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

# source aliases
source $HOME/.dotfiles/zsh/aliases.zsh
# source functions
source $HOME/.dotfiles/zsh/functions.zsh
# setup direnv - directory level variables
eval "$(direnv hook zsh)"
