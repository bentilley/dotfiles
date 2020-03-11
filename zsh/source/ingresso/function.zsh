# Ingresso helper functions

# docker
function dkr() {
  docker-compose kill $1
  docker-compose restart $1
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

function hash_from_pod() {
  kubectl describe pods $1 -n whitelabel-dev \
    | grep Image: \
    | grep eu.gcr
}

# connecting to core databases
function dbconnect() {
  case $1 in
    "leaf")
      mysql \
        --host=leafdb.ingresso.co.uk \
        --user=bentilley \
        --password=$(security find-generic-password -a "bentilley" -s "leafdb/mw_live" -w) \
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
        --password=$(security find-generic-password -a "bentilley" -s "dogbert/mw_dev" -w) \
        --port=9084 \
        --ssl-key="~/cert/key" --ssl-cert="~/cert/cert" --ssl-ca="~/cert/inter_cert" \
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
