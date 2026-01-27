#!/bin/bash
set -ex

APP_ID=$1
TARGET_WORKSPACE=$2

main() {
  if [ "$(window_count_in_workspace)" -eq 0 ]; then
    local win_id=$(winid_of_app_id)
    aerospace move-node-to-workspace "$TARGET_WORKSPACE" --window-id $win_id
    aerospace workspace "$TARGET_WORKSPACE"
  fi
}

window_count_in_workspace() {
  aerospace list-windows --workspace "$TARGET_WORKSPACE" --count
}

winid_of_app_id() {
  list_windows_json \
    | jq ".[] | select(.appid == \"$APP_ID\")" \
    | jq -r ".winid" \
    | head -n 1
}

list_windows_json() {
  echo "[$(list_windows_raw | paste -sd, -)]"
}

list_windows_raw() {
  local format='{"appid": "%{app-bundle-id}", "winid": "%{window-id}"}'
  aerospace list-windows --all --format "$format"
}

main
