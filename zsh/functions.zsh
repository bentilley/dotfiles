# Testing with Karma
function kstart() {
  npx karma start --no-single-run
}

function ktest() {
  npx karma run -- --grep=$1
}
