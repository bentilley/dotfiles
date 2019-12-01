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

# Working with git

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

# print out the functions defined in a file
function get_funcs_js() {
  cat $1 | \
    sed -n -E \
    -e '/(export)? function/s/.*function ([a-zA-Z]+)\(.*/\1/p'
}

function fzfd() {
  dirname $(fzf $1)
}

# function for printing topten most used commands
function commands() {
  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}
alias topten="history | commands | sort -rn | head"
