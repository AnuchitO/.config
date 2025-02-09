#!/bin/bash

# Function to sanitize session name
sanitize_session_name() {
  echo "$1" | tr '.' '_' | tr '/' '_'
}

# Function to handle directory selection
select_directory() {
  local dir

  if [ -z "$1" ]; then
      # zoxide query --list | grep -E '(\.idea|\.vscode)' | xargs -I {} zoxide remove "{}"
      dir=$(zoxide query --list | fzf)
  elif [ "$1" == "file" ]; then
    dir=$(find "$HOME/spaces" "$HOME/go/src" "$HOME/.config" -type f \
      \( -name ".git" \
        -o -name ".githug" \
        -o -name ".gradle" \
        -o -name ".husky" \
        -o -name ".idea" \
        -o -name ".meteor" \
        -o -name ".next" \
        -o -name ".terraform" \
        -o -name ".venv" \
        -o -name "google-cloud-sdk" \
        -o -name "kafka_2.13-3.0.0" \
        -o -name "node_modules" \
        -o -name "python3.12" \
        -o -name "target" \
        -o -name "vendor" \
        -o -name "x_node_modules" \
        -o -path "*/build" \
        -o -path "*/coverage/lcov-report" \
        -o -path "*/e2e/screenshots" \
        -o -path "*/gradle/wrapper" \
        -o -path "*/iconnect-cordova" \
        -o -path "*/ios/Pods" \
        -o -path "*/ios/third-party" \
        -o -path "*/lib/python*" \
        -o -path "*/reports/html*" \
        -o -path "*/ruby/lib" \
        -o -path "*/tests/screenshots" \
        -o -path "*/tmp/*" \
      \) \
      -prune \
      -o -type f -print | fzf )
  elif [ "$1" == "all" ]; then
    dir=$(find "$HOME/spaces" "$HOME/go/src" "$HOME/.config" -type d \
      \( -name ".git" \
        -o -name ".githug" \
        -o -name ".gradle" \
        -o -name ".husky" \
        -o -name ".idea" \
        -o -name ".meteor" \
        -o -name ".next" \
        -o -name ".terraform" \
        -o -name ".venv" \
        -o -name "google-cloud-sdk" \
        -o -name "kafka_2.13-3.0.0" \
        -o -name "node_modules" \
        -o -name "python3.12" \
        -o -name "target" \
        -o -name "vendor" \
        -o -name "x_node_modules" \
        -o -path "*/build" \
        -o -path "*/coverage/lcov-report" \
        -o -path "*/e2e/screenshots" \
        -o -path "*/gradle/wrapper" \
        -o -path "*/iconnect-cordova" \
        -o -path "*/ios/Pods" \
        -o -path "*/ios/third-party" \
        -o -path "*/lib/python*" \
        -o -path "*/reports/html*" \
        -o -path "*/ruby/lib" \
        -o -path "*/tests/screenshots" \
        -o -path "*/tmp/*" \
      \) \
      -prune \
      -o -type d -print | fzf )
  else
    dir="$1" # Use the argument directly as the directory
  fi
  echo "$dir"
}


DIR=$(select_directory "$@") # Pass all arguments to select_directory

echo "Selected directory: $DIR"
# Extract directory name for session name
# SESSION_NAME=$(basename "$DIR") | tr '.' '_'
SESSION_NAME=$(sanitize_session_name "$(basename "$DIR")")
echo "Session name: $SESSION_NAME"

# Check if the session exists
if [ -n "$DIR" ]; then
    has_session=$(tmux has-session -t "$SESSION_NAME")
    if ! [ -n "$has_session" ]; then
        # Create new tmux session with the selected directory and open Vim
        tmux new-session -s "$SESSION_NAME" -d -c "$DIR" vim $DIR
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

