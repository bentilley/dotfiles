# Vim helpers
function vag() {
  vim -p `ag $1 $2 | sed -E -e 's/(.*):[[:digit:]]+:.+/\1/' | uniq`
}

function vf() { 
  FZF=(fzf --multi --preview='bat --color=always --style=plain {}')
  if [ $((2 * $LINES)) -gt $COLUMNS ]; then
    FZF+=("--preview-window=down")
  fi

  if [ ! -z $1 ]; then
    FILES=$(find $1/* -type f | "${FZF[@]}")
  else
    FILES=$("${FZF[@]}")
  fi
  if [ $? -eq 0 ]; then
    FILES=$(echo $FILES | paste -s -d ' ' -)  # remove newlines
    print -S "vim $FILES"  # add to history
    vim $(echo $FILES)
  fi
}

function vimthat()  {
  LAST_BUFFER="$(fc -ln -1)"

  if [[ ! "$LAST_BUFFER" =~ '^rg' ]]; then
    printf "'vimthat' can only be used after 'rg'. "
    printf "Last command was '$LAST_BUFFER'.\n"
    return 1
  fi

  # add the -l option if it is missing
  if [[ ! "$LAST_BUFFER" =~ '-l' ]]; then
    LAST_BUFFER="$LAST_BUFFER -l"
  fi

  # get the thing after `rg` to start a search in vim when we load
  SEARCH_TERM=$(echo $LAST_BUFFER | sed -E -e 's/^rg //' -e 's/(\w+).*/\1/g')

  vim $(eval $LAST_BUFFER) -c "/$SEARCH_TERM"
}

# Pytest

function mypytest() {
  clear
  pytest -c ~/.dotfiles/pytest/pytest.ini "$@"
}

function ptf() {
  FZF=(fzf --multi --preview='bat --color=always --style=plain {}')
  if [ $((2 * $LINES)) -gt $COLUMNS ]; then
    FZF+=("--preview-window=down")
  fi
  PYTEST=(mypytest)

  if [ ! -z $1 ]; then
    FILES=$(find $1/* -type f | grep test | "${FZF[@]}")
  else
    FILES=$("${FZF[@]}")
  fi

  if [ $? -eq 0 ]; then
    FILES=$(echo $FILES | paste -s -d ' ')  # remove newlines
    print -S "$(echo ${PYTEST[@]}) $FILES"
    "${PYTEST[@]}" $(echo $FILES)
  fi
  
}

# Jest
function jf() {
  if [ ! -z $1 ]; then
    FILE=$(find $1/* -type f | grep test | fzf)
  else
    FILE=$(fzf)
  fi
  if [ $? -eq 0 ]; then
    npx jest $FILE --watch
  fi
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
  kubectx $1 && helm ls --all-namespaces
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
NOTE_DIR="$HOME/Documents/notes"
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

function print256colours() {
  for i in {0..255} ; do
      printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
      if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
          printf "\n";
      fi
  done
}

# Toggl

function tg() {
  toggl start -P 164660338 "$1" && tgopen
}

# Task Warrior

# function to toggle next in task warrior
function next() {
  TASK_ID="$1"
  OLD_TASK_ID=$(task +next ids)
  [[ ! -z $2 ]] && SHORT_DESC="short_desc:$2" || SHORT_DESC=""

  if [[ -z $OLD_TASK_ID ]]; then
    task "$TASK_ID" modify +next $SHORT_DESC
  else
    if [[ $OLD_TASK_ID -eq $TASK_ID ]]; then
      task "$TASK_ID" modify -next
    else
      task "$OLD_TASK_ID" modify -next
      task "$TASK_ID" modify +next $SHORT_DESC
    fi
  fi
}

function get_tasks() { 
  type="$1"
  case "$type" in
    gitlab)
      description=$(glab issue list --mine \
        | grep '^#' \
        | fzf \
        | sed -E -e 's/\s+\([a-z]+:[a-z-]+,.*//g')
      ;;
    *)
      echo "Task type $type is not configured"
      return 1
    ;;
  esac

  if [ -n "$description" ]; then
    task add project:ticket due:1week priority:H "$description"
  fi
}

# capture the stdout of a process
capture() {
    sudo dtrace -p "$1" -qn '
        syscall::write*:entry
        /pid == $target && arg0 == 1/ {
            printf("%s", copyinstr(arg1, arg2));
        }
    '
}


# LaTeX

function install_latex_class {
  # See http://matsguru.com/latex-hack-adding-a-custom-cls-to-your-search-path/
  if [ -f "$1" ]; then
    if [[ ! "$1" = *.cls ]]; then
      echo 'Can only install class files i.e. *.cls'
      return 1
    fi
    echo "Installing $1"
    cp "$1" "$(kpsewhich --var-value TEXMFLOCAL)/tex/latex/local"
    texhash
  fi
}
