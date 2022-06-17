# global aliasses
alias -g BG='&>/dev/null &'

# quick confing access
alias conf="lf $HOME/.dotfiles"
alias zconf="vim $ZDOTDIR/.zshrc"
alias zres="exec zsh"
alias zalias="vim ~/.dotfiles/zsh/source/aliases.zsh"
alias zfunc="vim ~/.dotfiles/zsh/source/functions.zsh"
alias zc="vim ~/.dotfiles/zsh/source"
alias vconf="vim ~/.vim/vimrc"
alias tconf="vim ~/.dotfiles/tmux/.tmux.conf"
alias kconf="vim ~/.config/karabiner/assets/complex_modifications"
alias gconf="vim ~/.dotfiles/git/gitconfig"
alias myali="cat ~/.dotfiles/zsh/aliases.zsh | sed \"s/alias\ //g\" | egrep -v \"(^#.*|^$|myali)\" | sort"
alias mconf="vim ~/.mutt/muttrc"

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

# vim aliasas
alias v="vim"
alias vs="vim -S Session.vim"
alias lvim='vim -c "normal '"'"'0"'
alias vlc="vim -p \`git diff-tree --name-only --no-commit-id -r HEAD\`"
alias vtag='vim $(git tmsu | xargs readlink -f)'

# toggl aliases
alias tgopen="firefox https://track.toggl.com"

# git aliases
alias gls="git --no-pager branch --list"
alias gdx="git ls-files --others --exclude-standard"
alias gdo="git --no-pager diff --name-only"
alias gcof='git checkout $(git --no-pager branch --list | fzf)'
alias grp='git rev-parse'
alias grps='git rev-parse --short'

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
