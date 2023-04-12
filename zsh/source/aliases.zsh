# shellcheck shell=bash
# global aliasses
alias -g BG='&>/dev/null &'

# quick confing access
alias conf="lf \$HOME/.dotfiles"
alias zconf="nvim \$ZDOTDIR/.zshrc"
alias zres="exec zsh"
alias zalias="nvim ~/.dotfiles/zsh/source/aliases.zsh"
alias zfunc="nvim ~/.dotfiles/zsh/source/functions.zsh"
alias zc="nvim ~/.dotfiles/zsh/source"
alias vconf="nvim ~/.config/nvim/init.lua"
alias tconf="nvim ~/.dotfiles/tmux/.tmux.conf"
alias kconf="nvim ~/.config/karabiner/assets/complex_modifications"
alias gconf="nvim ~/.dotfiles/git/gitconfig"
alias myali="cat ~/.dotfiles/zsh/aliases.zsh | sed \"s/alias\ //g\" | egrep -v \"(^#.*|^$|myali)\" | sort"
alias mconf="nvim ~/.mutt/muttrc"

# utils
alias wthr="curl wttr.in"

# Taskwarrior
alias todo="task summary && task calendar && task next"
alias a="add"
alias ta='task project:"$(git branch --show-current)" next'

# Exa (colourful ls)
alias lk="exa -lag -t=modified"

# applications chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# nvim aliasas
alias v="nvim"
alias lvim='nvim -c "normal '"'"'0"'
alias vlc="nvim -p \`git diff-tree --name-only --no-commit-id -r HEAD\`"
alias vtag='nvim $(git tmsu | xargs readlink -f)'

# toggl aliases
alias tgopen="firefox https://track.toggl.com"

# git aliases
alias gls="git --no-pager branch --list"
alias gdx="git ls-files --others --exclude-standard"
alias gdo="git --no-pager diff --name-only"
alias gcof='git checkout $(git --no-pager branch --list | fzf)'
alias grp='git rev-parse'
alias grps='git rev-parse --short'
alias grbic='grbi origin/$(git branch --show-current)'

# gcloud aliases
alias gcurl='curl  -H "Authorization: bearer $(gcloud auth print-identity-token)"'

# generate a import diagram for a directory
alias impdiag="bash ~/.dotfiles/scripts/plantuml_diagram.sh"

# jest
alias jdb="node --inspect-brk node_modules/.bin/jest --runInBand"

# kubectl aliases
alias k='kubectl'
alias kg='kubectl get'
alias kgw='kubectl get --watch'
alias kd='kubectl describe'
alias krm='kubectl delete'

# cloud_sql_proxy aliases
alias csp="cloud_sql_proxy"

# python virtual environments
alias va="source venv/bin/activate"
alias vd="deactivate"
# TODO make this a function which search recursively up through directories for venv

# tmux
alias t="tmux"
alias tn='cd ~ && tmux new -s info'

# Linux
if [[ "$(uname)" == "Linux" ]]; then
  alias pbcopy='xclip -selection clipboard -in'
  alias pbpaste='xclip -selection clipboard -out'
fi
