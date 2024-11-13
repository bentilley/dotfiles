# shellcheck shell=bash
# global aliasses
alias -g BG='&>/dev/null &'

# The 26 golden aliases
alias a="add"
alias d=docker     # docker
alias e="\$EDITOR" # edit
alias f="yazi"     # files
alias j="z"        # jump

# quick confing access
alias conf="lf \$HOME/.dotfiles"
alias zconf="\$EDITOR \$ZDOTDIR/.zshrc"
alias zres="exec zsh"
alias zalias="\$EDITOR ~/.dotfiles/zsh/source/aliases.zsh"
alias zfunc="\$EDITOR ~/.dotfiles/zsh/source/functions.zsh"
alias zc="\$EDITOR ~/.dotfiles/zsh/source"
alias vconf="\$EDITOR ~/.config/nvim/init.lua"
alias tconf="\$EDITOR ~/.dotfiles/tmux/.tmux.conf"
alias kconf="\$EDITOR ~/.config/karabiner/assets/complex_modifications"
alias gconf="\$EDITOR ~/.dotfiles/git/gitconfig"
alias myali="cat ~/.dotfiles/zsh/aliases.zsh | sed \"s/alias\ //g\" | egrep -v \"(^#.*|^$|myali)\" | sort"
alias mconf="\$EDITOR ~/.mutt/muttrc"

# docker
# alias d=docker
alias di="docker images"
alias dp="docker ps -a"
alias dsp="docker system prune"
alias 'dsp!'="docker system prune --force"
alias dtmp="docker run -it --rm"
alias lzd="lazydocker"

# utils
alias wthr="curl wttr.in"

# Taskwarrior
alias todo="task summary && task calendar && task next"
# alias a="add"
alias ta='task project:"$(git branch --show-current)" next'

# Exa (colourful ls)
alias lk="eza -lag -t=modified"

# applications chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# nvim aliases
alias lvim='nvim -c "normal '"'"'0"'
alias vlc="nvim -p \`git diff-tree --name-only --no-commit-id -r HEAD\`"
alias vtag='nvim $(git tmsu | xargs readlink -f)'

# go aliases
alias goprof="go tool pprof -http=:8080"

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
alias gmt='git mergetool'

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
# alias t="tmux"
alias tn='cd ~ && tmux new -s info'

# Linux
if [[ "$(uname)" == "Linux" ]]; then
  alias pbcopy='xclip -selection clipboard -in'
  alias pbpaste='xclip -selection clipboard -out'
fi
