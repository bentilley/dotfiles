# shellcheck shell=bash

# Get the value from an environment variable, or ask the user for input.
#
# This means that the request can be configured using environment variables,
# but if this hasn't been done it will just prompt the user for manual input.
input() {
  if [[ "$#" -ne 1 ]]; then
    echo "input, usuage: input <variable>, e.g. input username"
    exit 1
  fi

  local env_var_name="WM_${1^^}"

  if [ -z "${!env_var_name}" ]; then
    read -r -p "Enter $1: " "${env_var_name?}"
  fi
  printf "%s" "${!env_var_name}"
}

# Same as `input`, but for secret values.
input_secret() {
  if [[ "$#" -ne 1 ]]; then
    echo "input_secret, usuage: input_secret <variable>, e.g. input_secret username"
    exit 1
  fi

  local env_var_name="WM_${1^^}"

  if [ -z "${!env_var_name}" ]; then
    read -rs -p "Enter $1: " "${env_var_name?}"
  fi
  printf "%s" "${!env_var_name}"
}

# Get the value from an environment variable, or ask the user to select a value
# from a list.
#
# This means that the request can be configured using environment variables,
# but if this hasn't been done it will just prompt the user for manual input.
input_select() {
  if [[ "$#" -ne 2 ]]; then
    echo "input_select, usuage: input_select <variable> <list>, e.g. input_select name get_names"
    exit 1
  fi

  local env_var_name="WM_${1^^}"
  local list_func="$2"

  if [ -z "${!env_var_name}" ]; then
    $list_func | fzf --prompt "Select $1: "
  fi
  printf "%s" "${!env_var_name}"
}

# List the keys of an associative array, and let the user choose one, return
# the value.
#
# This can also be short circuited by setting the desired key in the
# environment variable provided in the second argument.
filter_array() {
  if [[ "$#" -ne 2 ]]; then
    echo "filter_array, usuage: filter_array <associative_array> <key_override>, e.g. filter_array HOSTS ENV"
    exit 1
  fi

  local -n array=$1
  if [[ -z $2 ]]; then
    local query=""
  else
    local -n query=$2
  fi

  for i in "${!array[@]}"; do
    echo "$i ${array[$i]}"
  done | fzf \
    --with-nth 1 \
    --query "$query" \
    --bind 'one:become(echo {2})' \
    --bind 'enter:become(echo {2})'
}
