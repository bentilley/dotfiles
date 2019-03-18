# quick confing access
alias zconf="vim ~/.zshrc"
alias zres="source ~/.dotfiles/zsh/.zshrc"        # restart zshrc
alias omz="vim ~/.oh-my-zsh"
alias zalias="vim ~/.dotfiles/zsh/aliases.zsh"
alias zfunc="vim ~/.dotfiles/zsh/functions.zsh"
alias vconf="vim ~/.vimrc"
alias myali="cat ~/.dotfiles/zsh/aliases.zsh | sed \"s/alias\ //g\" | egrep -v \"(^#.*|^$|myali)\" | sort"

alias vf="vim \`fzf\`"
alias jf="jest \`fzf\` --watch"

# applications chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# git aliases
alias vlc="vim -p \`git diff-tree --name-only --no-commit-id -r HEAD\`"
alias gls="git --no-pager branch --list"
alias showbranches="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

# generate a import diagram for a directory
alias impdiag="bash ~/.dotfiles/zsh/commands/plantuml_diagram.sh"

# kubectl aliases
alias k='kubectl'
alias kg='kubectl get'
alias kgw='kubectl get --watch'
alias kd='kubectl describe'
alias krm='kubectl delete'

# cloud_sql_proxy aliases
alias csp="cloud_sql_proxy"
alias cspas="cloud_sql_proxy --projects tsw-asgard -dir /tmp"
alias cspdev="cloud_sql_proxy --projects tsw-develop -dir /tmp"

# Ingresso aliases
alias wlpy="python manage.py runserver"
alias wlng="ngrok http --subdomain localtest1 --region=eu 8000"
alias wlconf="vim .env"
alias ghash="git rev-parse --short=10 HEAD"
alias ghash^="git rev-parse --short=10 HEAD^"
alias qame="./scripts/deploy.sh wl-qa \`ghash\`"
alias qa="./scripts/deploy.sh wl-qa 85cc36d6f4"
alias badpods='kubectl get po --all-namespaces -owide | grep -vE "Running|Completed" '
alias inotes='pandoc ~/Documents/ingresso/notes.md -s \
              -o ~/Documents/ingresso/notes.html \
              --metadata pagetitle="Ingresso Notes" \
              && chrome --new-window ~/Documents/ingresso/notes.html \
              && vim ~/Documents/ingresso/notes.md'

# Ingresso - Groupon
alias grouponbehave="env GROUPON_REMOTE_URL='https://groupon-dev.ticketswitch.io/' behave --no-capture --stop"

function fzfd() {
  dirname $(fzf $1)
}

# Ingresso helper functions
function dkr() {
  docker-compose kill $1
  docker-compose restart $1
}

# function for printing topten most used commands
function commands() {
  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}
alias topten="history | commands | sort -rn | head"
