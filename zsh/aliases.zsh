# quick confing access
alias zconf="vim ~/.zshrc"
alias zres="source ~/.dotfiles/zsh/.zshrc"        # restart zshrc
alias omz="vim ~/.oh-my-zsh"
alias zalias="vim ~/.dotfiles/zsh/aliases.zsh"
alias vconf="vim ~/.vimrc"
alias myali="cat ~/.dotfiles/zsh/aliases.zsh | sed \"s/alias\ //g\" | egrep -v \"(^#.*|^$|myali)\" | sort"

alias vf="vim \`fzf\`"
alias jf="jest \`fzf\` --watch"

# generate a import diagram for a directory
alias impdiag="bash ~/.dotfiles/zsh/commands/plantuml_diagram.sh"

# Ingresso aliases
alias wlres="git checkout docker-compose.yaml nginx/conf.d/fragments/helm.conf nginx/conf.d/vhost.conf"
alias wlpy="python manage.py runserver --settings=whitelabel.settings.local"
alias wlng="ngrok http --subdomain localtest1 --region=eu 8000"
alias ghash="git rev-parse --short=10 HEAD"
alias ghash^="git rev-parse --short=10 HEAD^"
alias qame="./scripts/deploy.sh wl-qa \`ghash\`"
alias qa="./scripts/deploy.sh wl-qa 85cc36d6f4"

function fzfd() {
  dirname $(fzf $1)
}

# Ingresso aliases
alias cspas="cloud_sql_proxy --projects tsw-asgard -dir /tmp"

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
