#!/bin/bash

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
    dir=$(find "${find_paths[@]}" -type f "${excludes_prune[@]}" -o -type f -print | fzf)
  elif [ "$1" == "folders" ]; then
    dir=$(find "${find_paths[@]}" -type d "${excludes_prune[@]}" -o -type d -print | fzf)
  else
    dir="" # Return empty string
  fi
  echo "$dir"
}


SELECTED=$(select_directory "$@") # Pass all arguments to select_directory
WORKING_DIR=$(get_dir "$SELECTED")

echo "Selected: $SELECTED"
# Extract directory name for session name
SESSION_NAME=$(sanitize_session_name "$(basename "$SELECTED")")
echo "Session name: $SESSION_NAME"
echo "Directory: $SELECTED"
echo "Working directory: $WORKING_DIR"

# Check if the session exists
if [ -n "$SELECTED" ]; then
    has_session=$(tmux has-session -t "$SESSION_NAME")
    if ! [ -n "$has_session" ]; then
        # Create new tmux session with the selected directory and open Vim
        tmux new-session -s "$SESSION_NAME" -d -c "$WORKING_DIR" vim $SELECTED
    fi

    echo "already in tmux session or not"
    if tmux list-clients | grep -q "attached"; then
        tmux switch-client -t "$SESSION_NAME"
    else
        tmux attach-session -t "$SESSION_NAME"
    fi
else
    echo "No directory selected"
fi

