#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

main() {
  JIRA_API_TOKEN="$(pass show jira)"
  export JIRA_API_TOKEN

  # Read the original task and modified task from stdin
  read -r original_task
  read -r modified_task

  # Output the modified task to stdout to complete the hook process - this hook
  # doesn't actually do any modifying, just syncing.
  echo "$modified_task"

  for property in description priority jirastatus status; do
    orig=$(echo "$original_task" | jq --arg prop "$property" -r '.[$prop]' || true)
    mod=$(echo "$modified_task" | jq --arg prop "$property" -r '.[$prop]' || true)
    if [[ "$orig" != "$mod" ]]; then
      local jira_id="$(echo "$original_task" | jq --raw-output .jira)"
      case "$property" in
      description)
        jira_description_update "$jira_id" "$mod"
        ;;
      priority)
        jira_priority_update "$jira_id" "$mod"
        ;;
      jirastatus)
        jira_status_update "$jira_id" "$mod"
        ;;
      status)
        status_update "$jira_id" "$mod"
        ;;
      esac
    fi
  done
}

jira_description_update() {
  local description="$2"
  echo jira issue edit "$1" --no-input --body "$description"
  jira issue edit "$1" --no-input --body "$description"
}

declare -A jira_priorities=(
  ["H"]="High"
  ["M"]="Medium"
  ["L"]="Low"
)

jira_priority_update() {
  local jira_priority="${jira_priorities[$2]}"
  echo jira issue edit "$1" --no-input --priority "${jira_priority}"
  jira issue edit "$1" --no-input --priority "${jira_priority}"
}

jira_status_update() {
  echo jira issue move "$1" "$2"
  jira issue move "$1" "$2"
}

status_update() {
  if [[ "$2" = "completed" ]]; then
    echo jira issue move "$1" "Closed"
    jira issue move "$1" "Closed" --resolution "Done"
  fi
}

main "$@"
