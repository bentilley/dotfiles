# Functions for helping to use pytest

function mypytest() {
  clear
  pytest -c ~/.dotfiles/pytest/pytest.ini "$@"
}

pywatch() {
  fswatch -o $2 $3 | \
    (while read; do \
    pytest --disable-pytest-warnings -v $1; \
  done)
}

# Jest

# function jf() {
#   if [ ! -z $1 ]; then
#     FILE=$(find $1/* -type f | grep test | fzf)
#   else
#     FILE=$(fzf)
#   fi
#   if [ $? -eq 0 ]; then
#     npx jest $FILE --watch
#   fi
# }

# Working with git

# We wrap in a local function instead of exporting the variable directly in
# order to avoid interfering with manually-run git commands by the user.
function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
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
