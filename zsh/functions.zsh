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
  kctx $1 && helm ls
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
