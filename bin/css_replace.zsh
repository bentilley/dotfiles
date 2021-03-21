#!/bin/bash
#{ for i in $(cat amp/amp_css.html | ag '^\.[a-z0-9\-]+ {$' | sed -E 's/^\.([a-z0-9\-]+).*/\1/g'); do echo "$(ag "class=.*[\" ]$i ?" --html | wc -l) $i"; done } | ag '\s+0 '
#perl -i~ -0777 -pe 's/.show-flex \{[^\}]+\}//' amp/amp_css.html

# COLOURS
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
NC="\033[0m"

CSS_FILE=$1

main() {
  if [ -f "$CSS_FILE" ]
  then
    if [ ! -f "$CSS_FILE.bak" ]
    then
      backUpFile $CSS_FILE
    fi
    css_replace $CSS_FILE
  fi
}

backUpFile() {
  echo -e "Creating backup of $CSS_FILE at \"$CSS_FILE.bak\"\n"
  cp $1 "$1.bak"
}

css_replace() {
  totalLinesDeleted=0
  for class in $(getCssClassNames $CSS_FILE)
  do
    numOcc=$(countClassOccurences $class)
    if [ $numOcc = 0 ]
    then
      echo -e "$RED$class$NC will be removed because it is not being used."
      cssToDelete=$(getClassToBeDeleted $CSS_FILE $class)
      echo -e "$YELLOW$cssToDelete$NC"
      deleteClass "$CSS_FILE" "$class"
      totalLinesDeleted=$(($totalLinesDeleted + $(numLines "$cssToDelete")))
    else
      echo -e "$GREEN$class$NC is being used."
    fi
  done
  echo "$totalLinesDeleted lines have been deleted!"
}

numLines() {
  echo "$1" | wc -l | trim
}

getCssClassNames() {
  cat $1 |
  ag '^\.[a-z0-9\-]+ {$' |
  sed -E 's/^\.([a-z0-9\-]+).*/\1/g'
}

countClassOccurences() {
  ag "class=.*[\" ]$1[\" ]" --html |
  wc -l | trim
}

trim() {
  awk '{$1=$1;print}'
}

getClassToBeDeleted() {
  awk "/^\.$2 {/,/}/" $1
}

deleteClass() {
  perl -i~ -0777 -pe "s/^\.$2 \{[^\}]+\}//m" $1
}

main
