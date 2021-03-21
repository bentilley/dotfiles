#!/bin/zsh
echo "hi"
 
DIR=$1
OUTPUT=$1"/modules.png"
FILTER=$2
 
main() {
  echo "hug"
  generateDiagram $OUTPUT && open $OUTPUT
}
 
generateDiagram() {
  #files=$(findFiles)
 
  dan |
  #replaceImport |
  #findFiles |
  #findImports |
  #stripLeadingDirectories |
  #generatePlantuml |
  removeDuplicates |
  addPlantumlTags | tee "./plantuml.txt" | cat |
  filterModules | cat |
  createDiagram > $OUTPUT
}

dan() {
  find $DIR -type f -name '*.js' | while read F; do
    cat "$F" | grep -E '^import' \
        | sed -E -e 's/[^"]*"//' \
        -e "s/[^']*'//" \
        -e 's/".*//' \
        -e "s/'.*//" -e 's/.*\///'| while read G; do
            echo "[$G] --> [$(basename "$F" | sed 's/.js$//')]"
        done
  done
}

replaceImport () {
  sed -E "s/import \{/action_types/"
}
 
findFiles() {
  find $DIR -name '*.js'
}
 
findImports() {
  xargs grep -e "^import.* from"
}
 
stripLeadingDirectories() {
  sed -E "s/^\.[a-zA-Z_\/]*\///"
  #sed -E "s/^\.\/\w*\///"
}
 
generatePlantuml() {
  sed -E "s/^([a-zA-Z_]+)\.js:import.*from [\'\"]\.*([a-zA-Z_\/-]+)(\.js)?(\.svg)?[\'\"];.*/[\2] --> [\1]/"
  #x="$(sed -E "s/^([a-zA-Z_]+)\.js:import.*from [\'\"]([a-zA-Z_\/\.]+)(\.js)?[\'\"];/\1:\2/")"
  #to=$(echo $x | cut -d ":" -f 1)
  #f=$(echo $x | cut -d ":" -f 2)
  #from=$(echo $f | sed -E "s/\.*([a-zA-Z_\/])(\.js)?/\1/")
  #echo "from $f"
  #echo "to $to"
  #echo [${from}] --> [${to}]
  #sed -E "s/^([a-zA-Z_]+)\.js:import.*from \"\.?\/?[a-zA-Z_\/]\/([a-zA-Z_]+).*\";$/[\1] --> [\2]/"
  #sed -E "s/^([^/]+)[^:]*:import.*from '${MODULES}\/([^/]+).*'$/[\1] --> [\2]/"
}
 
removeDuplicates() {
  sort | uniq
}

filterModules() {
  grep -v -E $FILTER
}

addPlantumlTags() {
  (echo "@startuml" && cat && echo "@enduml")
}
 
createDiagram() {
  plantuml -pipe -v
}
 
main
