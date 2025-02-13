#!/bin/bash

# current directory relative to the script
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ENABLE_DEBUG=false
debug() {
  if [ "$ENABLE_DEBUG" = false ]; then
      return
  fi

  echo "DEBUG: $1"
}

mkdir -p "$CURRENT_DIR/.cache"
CACHED_FILES="$CURRENT_DIR/.cache/files"
CACHED_FOLDERS="$CURRENT_DIR/.cache/folders"

# Function to sanitize session name
sanitize_session_name() {
  echo "$1" | tr '.' '_' | tr '/' '_'
}

get_dir() {
    local dir

    if [ -d "$1" ]; then
        dir="$1"  # If it's a directory, use it as is.
    else
        dir=$(dirname "$1")  # If it's a file, get its directory name.
    fi
    echo "$dir"
}

# Function to handle directory selection
select_directory() {
  local dir

  local find_paths=("$HOME/spaces" "$HOME/go/src" "$HOME/.config")

  # Exclude patterns for -name
  local exclude_names=(
   ".DS_Store"
  )

  # Exclude patterns for -path
  local exclude_paths=(
    "*/.git/*" "*/build/*" "*/coverage/lcov-report/*" "*/e2e/screenshots/*"
    "*/gradle/wrapper/*" "*/iconnect-cordova/*" "*/vendor/*"
    "*/classes/com*" "*/classes/org*" "*/classes/net*" "*/classes/io*" "*/classes/javax*" "*/classes/java*" "*/classes/kotlin*" "*/classes/scala*"
    "*/google-cloud-sdk/*" "*/kafka_2.13-3.0.0/*" "*/node_modules/*" "*/python3.12" "*/target/*" "*/x_node_modules/*"
    "*/.githug/*" "*/.gradle/*" "*/.husky/*" "*/.idea/*" "*/.meteor/*" "*/.next/*" "*/.terraform/*" "*/.venv/*" "*/.stack-work/*" "*/.vscode"
    "*/ios/Pods*" "*/ios/third-party/*" "*/lib/python*" "*/reports/html*" "*/ruby/lib*"
    "*/tests/screenshots" "*/tmp/*"
    "*/.expo/*" "*/.expo-shared/*" "*/.expo-updates/*" "*/.expo-shared/*" "*/.expo-updates/*"
    "*/*.xcodeproj*" "/*.xcworkspace*" "*/Pods/*" "*/Podfile.lock" "*/Pods.xcodeproj" "*/Pods.xcworkspace"
    "*/bin/Debug/*" "*/obj/Debug/*" "*/bin/Release/*" "*/obj/Release/*"
    "*/srv/gitlab/data/*" "*/srv/gitlab/logs/*"
    "*/.cache/webpack/*" "*/.cache/*" "*/.yarn/*" "*/.yarnrc.yml" "*/.yarnrc" "*/.angular/cache/*"
  )

  local excludes_prune=( -name ".git" )
  # Add -name excludes
  for pattern in "${exclude_names[@]}"; do
      excludes_prune+=( -o -name "$pattern" )
  done
  # Add -path excludes
  for pattern in "${exclude_paths[@]}"; do
      excludes_prune+=( -o -path "$pattern" )
  done

  excludes_prune=( \( "${excludes_prune[@]}" \) -prune ) # Crucial: Prune *after* all excludes

  if [ -z "$1" ]; then
      # zoxide query --list | grep -E '(\.idea|\.vscode)' | xargs -I {} zoxide remove "{}"
      dir=$(zoxide query --list | fzf)
  elif [ "$1" == "files" ]; then
      if [ -f "$CACHED_FILES" ]; then
        dir=$(cat $CACHED_FILES | fzf)
      else
        dir=$(find "${find_paths[@]}" -type f "${excludes_prune[@]}" -o -type f -print| tee $CACHED_FILES | fzf)
      fi
  elif [ "$1" == "folders" ]; then
      if [ -f "$CACHED_FOLDERS" ]; then
        dir=$(cat $CACHED_FOLDERS | fzf)
      else
        dir=$(find "${find_paths[@]}" -type d "${excludes_prune[@]}" -o -type d -print | tee $CACHED_FOLDERS | fzf)
      fi
  else
    dir="" # Return empty string
  fi
  echo "$dir"
}


SELECTED=$(select_directory "$@") # Pass all arguments to select_directory
WORKING_DIR=$(get_dir "$SELECTED")

debug "Selected: $SELECTED"
# Extract directory name for session name
SESSION_NAME=$(sanitize_session_name "$(basename "$SELECTED")")
debug "Session name: $SESSION_NAME"
debug "Directory: $SELECTED"
debug "Working directory: $WORKING_DIR"

# Check if the session exists
if [ -n "$SELECTED" ]; then
    has_session=$(tmux has-session -t "$SESSION_NAME" 2>/dev/null; echo $?)
    if ! [ "$has_session" -eq 0 ]; then
        # Create new tmux session with the selected directory and open Vim
        tmux new-session -d -s "$SESSION_NAME" -c "$WORKING_DIR" vim $SELECTED
        tmux new-window -d -t "$SESSION_NAME" -n "terminal"  -c "$WORKING_DIR"
        tmux new-window -d -t "$SESSION_NAME" -n "backend"  -c "$WORKING_DIR"
        tmux new-window -d -t "$SESSION_NAME" -n "frontend"  -c "$WORKING_DIR"

        tmux select-window -t "${SESSION_NAME}:1" # Select the first window (Vim)
    fi

    if tmux list-clients | grep -q "attached"; then
        debug "already in tmux session: switch-client"
        tmux switch-client -t "${SESSION_NAME}"
    else
        debug "attach-session"
        tmux attach-session -t "${SESSION_NAME}"
    fi
else
    debug "No directory selected"
fi

