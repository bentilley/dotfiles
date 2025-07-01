#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

jira_select_epic() {
  jira issue list \
    -tEpic \
    -s"In Progress" \
    --plain \
    --no-headers |
    fzf --height '50%' --reverse |
    awk '{ print $2 }'
  # --created-after "$(date +%Y-%m-%d -d'1 year ago')" \
}

jira_select_issue_type() {
  yq -r '.issue.types.[].name' <~/.config/.jira/.config.yml |
    fzf --height '50%' --reverse
}

main() {
  # Read the new task from stdin
  read -r new_task

  if [[ "$(echo "$new_task" | jq -r '.jira')" != "null" ]]; then
    echo "$new_task"
    echo Task already has Jira issue, skipping...
    return 0
  fi

  declare -A priorities_map=(
    ["H"]="High"
    ["M"]="Medium"
    ["L"]="Low"
  )

  jira_summary="$(echo "$new_task" | jq -r '.description')"
  task_priority="$(echo "$new_task" | jq -r '.priority')"
  jira_priority="${priorities_map[$task_priority]:-Low}"

  output="$(jira issue create \
    --type "$(jira_select_issue_type)" \
    --parent "$(jira_select_epic)" \
    --priority "$jira_priority" \
    --assignee benjamin.tilley@troweprice.com \
    --summary "$jira_summary")"

  #   output='
  # * Issue created
  # https://troweprice.atlassian.net/browse/FQD-6671'

  jira_id="$(sed -n '/https/s/https:\/\/.*browse\///p' <<<"$output")"

  # Output the modified task to stdout to complete the hook process.
  echo "$new_task" | jq --compact-output \
    --arg jira_id "$jira_id" \
    ' . += { jira: $jira_id, jirastatus: "Planning" }'
  echo "$output"
}

main "$@"
