# shellcheck shell=bash

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
