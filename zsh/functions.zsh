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
