# Vim helpers
function vag() {
  vim -p `ag $1 $2 | sed -E -e 's/(.*):[[:digit:]]+.+/\1/' | uniq`
}

# Testing with Karma
function kstart() {
  npx karma start --no-single-run
}

function ktest() {
  npx karma run -- --grep=$1
}

# Kubernetes
function swap() {
  kubectx $1 && helm ls
}

# function for calling f13 on given end point and user
function get_event_ids() {
  AUTH=$(echo $HASH_AUTH_OVERRIDE | base64 -D)
  curl -u $1"/#"$AUTH \
    --compressed https://$2/f13/events.v1 \
    | jq . \
    | ag event_id \
    | sed -E 's/^.*: "(.+)",$/\1/g'
}

# update the change log and commit
function ucl() {
  vim CHANGELOG.md
  ./scripts/bump_version
  git add -u
  git commit -m "updated changelog and version number"
}

function tag() {
  git tag `cat VERSION`
  git push --tags
}

# Managing tmux sessions
function workon() {
  SESSION_NAME=$1
  tmux a -t $SESSION_NAME || start_session $SESSION_NAME
}

function start_session() {
  CONFIG_DIR=~/.dotfiles/tmux/session
  SESSION_CONFIG=$CONFIG_DIR/$SESSION_NAME

  if [[ -f $SESSION_CONFIG ]]; then
    tmux new -s $SESSION_NAME "tmux source $SESSION_CONFIG"
  else
    create_session
  fi
}

create_session() {
  read NEW_SESSION"?No session with the name \"$SESSION_NAME\" exists. Would you like to create one (y/n)?"
  if [[ -z $NEW_SESSION ]]; then; echo "No session created"; return 1
  elif [[ $NEW_SESSION = 'y' ]]; then
    cp $CONFIG_DIR/template $SESSION_CONFIG
    vim "$SESSION_CONFIG"
    echo "Session $SESSION_NAME create at $CONFIG_DIR"
    tmux new -s $SESSION_NAME "tmux source $SESSION_CONFIG"
  fi
}
