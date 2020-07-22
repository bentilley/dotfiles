# quick confing access
alias conf="lf $HOME/.config"
alias zconf="vim $ZDOTDIR/.zshrc"
alias zres="source $ZDOTDIR/.zshrc"
alias zalias="vim ~/.dotfiles/zsh/source/personal/aliases.zsh"
alias zfunc="vim ~/.dotfiles/zsh/source/personal/functions.zsh"
alias zc="vim ~/.dotfiles/zsh/source"
alias vconf="vim ~/.vim/vimrc"
alias tconf="vim ~/.dotfiles/tmux/.tmux.conf"
alias kconf="vim ~/.config/karabiner/assets/complex_modifications"
alias myali="cat ~/.dotfiles/zsh/aliases.zsh | sed \"s/alias\ //g\" | egrep -v \"(^#.*|^$|myali)\" | sort"
alias mconf="vim ~/.mutt/muttrc"

# Taskwarrior
alias todo="task summary && task calendar && task next"

# Exa (colourful ls)
alias lk="exa -lag -t=modified"

# applications chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# vim aliasas
alias vs="vim -S Session.vim"

# git aliases
alias vlc="vim -p \`git diff-tree --name-only --no-commit-id -r HEAD\`"
alias gls="git --no-pager branch --list"
# showbranches
alias sb="git for-each-ref \
  --sort=committerdate refs/heads/ \
  --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

# generate a import diagram for a directory
alias impdiag="bash ~/.dotfiles/scripts/plantuml_diagram.sh"

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
alias ta='tmux attach'
alias tn='cd ~ && tmux new -s info'
alias tx='tmux new -s $(basename $(pwd))'
