# Vim helpers
function vag() {
  vim -p `ag $1 $2 | sed -E -e 's/(.*):[[:digit:]]+:.+/\1/' | uniq`
}

function efail() {
  vim $(\
    jest $1 \
    --reporters="<rootDir>/bens-stuff/jest-reporters/failing-files-only.js" \
    2>/dev/null\
  )
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

# Working with git
#
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

# view an issue in github in web browser
function ish() {
  chrome "$(hub browse -u -- issues)/$1"
}

# view a pull request in github in web browser
function pull() {
  chrome "$(hub browse -u | sed -E -e 's/(.*white-label).*/\1/g')/pull/$1"
}

# seeing all TODO comments in a directory
function todos() {
  ag '// TODO ' $1 | sed -E -e 's/.*\/\/ TODO/TODO/'
  echo "Number of TODOs: $(ag '// TODO ' $1 | wc -l)"
}

# working on different things
function work_list() {
  ls -1 ~/.dotfiles/scripts/automator/automation \
    | sed -E -e "s/\.workflow//g"
}

function work_auto() {
  echo "~/.dotfiles/scripts/automator/automation/$1.workflow"
  automator ~/.dotfiles/scripts/automator/automation/$1.workflow
}

function gobackto() {
  if [ $1 = "ls" ]; then
    echo "what do you want to go back to?"
    for file in $(ls ~/.dotfiles/scripts/gobackto); do
      echo "* $file"
    done
  elif [ $1 = "edit" ]; then
    vim ~/.dotfiles/scripts/gobackto/$2
  else
    echo "lets start working on $1"
    zsh "~/.dotfiles/scripts/gobackto/$1"
  fi
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

# Note taking
NOTE_DIR='/Users/jammy/notes'
function note() {
  if [ -z "$1" ]; then
    echo "Run 'note ls' to see notes, or 'note <note-name>' to get started!"
  elif [ "$1" = "ls" ]; then
    ls "$NOTE_DIR" | sed -E -e "s/\.md//g"
  else
    $EDITOR "$NOTE_DIR/$1.md"
  fi
}

# smart git clone that also does npm install
function clone() {
  git clone $1
  cd $(basename ${1%.*})
  if test -f "./package.json"; then
    echo "..."
    echo "Found package.json... installing dependencies"
    echo "..."
    npm install
  fi
}


# Ingresso Helper functions
# TODO create a separate file for these

# seeing what's deployed to different environments
function whatson() {
  kubectl get pods \
    -n whitelabel-dev \
    -l release=whitelabel-$1 \
    --context dev-cluster \
    -o jsonpath="{..image}" \
    | tr -s '[[:space:]]' '\n' \
    | grep eu.gcr \
    | uniq
}

# connecting to core databases
function dbconnect() {
  case $1 in
    "leaf")
      mysql \
        --host=leafdb.ingresso.co.uk \
        --user=bentilley \
        --password=$(security find-generic-password -a "bentilley@leafdb.ingresso.co.uk/mw_live" -w) \
        --port=9084 \
        --ssl-key="~/cert/key" --ssl-cert="~/cert/cert" --ssl-ca="~/cert/inter_cert" \
        mw_live
      ;;
    "core")
      mysql \
        --host=hkdb.ingresso.co.uk \
        --user=bentilley \
        --password=$(security find-generic-password -a "bentilley@hkdb.ingresso.co.uk/mw_live" -w) \
        --port=9084 \
        --ssl-key="~/cert/key" --ssl-cert="~/cert/cert" --ssl-ca="~/cert/inter_cert" \
        mw_live
      ;;
    "dev")
      mysql \
        --host=dogbert.ingresso.co.uk \
        --user=bentilley \
        --password=$(security find-generic-password -a "bentilley@dogbert.ingresso.co.uk/mw_dev" -w) \
        --port=9084 \
        mw_dev
      ;;
    "ls")
      echo "leaf, core, dev"
      ;;
  esac
}

function dbquery() {
  mysql -A\
    --host=leafdb.ingresso.co.uk \
    --user=bentilley \
    --password=$(security find-generic-password -a "bentilley@leafdb.ingresso.co.uk/mw_live" -w) \
    --execute=$1 \
    --port=9084 \
    --ssl-key="~/cert/key" --ssl-cert="~/cert/cert" --ssl-ca="~/cert/inter_cert" \
    mw_live
}

# getting bad payment intents
function pierrors() {
  echo "running query:"
  echo "SELECT stripe_id, account_name, description, created_time, amount \
    FROM stripe_charges \
    WHERE stripe_charges.description \
    IN $(get_pi_ids);"
  dbquery "SELECT stripe_id, account_name, description, created_time, amount \
    FROM stripe_charges \
    WHERE stripe_charges.stripe_id \
    IN $(get_pi_ids);"
}

function get_pi_ids() {
  pbpaste |\
    prettier --stdin --parser html |\
    gsed -E \
    -e "1i(" \
    -e "/pi_/!d ; /pi_/s/.*(pi_[a-zA-Z0-9]+).*/'\1',/g" |\
    gsed -e "\${ s/',/'/ ; a)
      }"
}

# print out the functions defined in a file
function get_funcs_js() {
  cat $1 | \
    sed -n -E \
    -e '/(export)? function/s/.*function ([a-zA-Z]+)\(.*/\1/p'
}
