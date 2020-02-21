# Ingresso aliases

alias whatio="kubectl get pods -n whitelabel-dev -l release=whitelabel-ben --context dev-cluster -o jsonpath="{..image}" | tr -s '[[:space:]]' '\n' | grep eu.gcr | uniq"
alias wlpys="python manage.py runserver_plus --cert-file /Users/jammy/cert/wl-self-signed/_wildcard.bendev.ingresso.co.uk+3.crt --key-file /Users/jammy/cert/wl-self-signed/_wildcard.bendev.ingresso.co.uk+3.key --reloader-interval 5"
alias wlng="ngrok http --subdomain localtest1 --region=eu 8000"
alias wlconf="vim .env"
alias ghash="git rev-parse --short=10 HEAD"
alias ghash^="git rev-parse --short=10 HEAD^"
alias badpods='kubectl get po --all-namespaces -owide | grep -vE "Running|Completed" '
alias inotes='pandoc ~/Documents/ingresso/notes.md -s \
              -o ~/Documents/ingresso/notes.html \
              --metadata pagetitle="Ingresso Notes" \
              && chrome --new-window ~/Documents/ingresso/notes.html \
              && vim ~/Documents/ingresso/notes.md'
alias helm2="/usr/local/opt/helm@2/bin/helm" # delete me when you don't need helm 2 anymore

# Groupon
alias grouponbehave="env GROUPON_REMOTE_URL='https://groupon-dev.ticketswitch.io/' behave --no-capture --stop"

# cloud_sql_proxy aliases
alias cspas="cloud_sql_proxy --projects tsw-asgard -dir /tmp"
alias cspdev="cloud_sql_proxy --projects tsw-develop -dir /tmp"
