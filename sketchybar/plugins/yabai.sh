#!/bin/bash

window_state() {
  source "$HOME/.config/sketchybar/colors.sh"
  source "$HOME/.config/sketchybar/icons.sh"

  # WINDOW=$(yabai -m query --windows --window)
  # CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')
  CURRENT=$(aerospace list-workspaces --all)

  args=()
  if [[ $CURRENT -gt 0 ]]; then
  #   LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
  #   args+=(--set $NAME icon=$YABAI_STACK icon.color=$RED label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))
  #   yabai -m config active_window_border_color $RED > /dev/null 2>&1 
    echo "active window corder"
  else
    args+=(--set $NAME label.drawing=off)
    echo "off"
  #   case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
  #     "false")
  #       if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
  #         args+=(--set $NAME icon=$YABAI_FULLSCREEN_ZOOM icon.color=$GREEN)
  #         yabai -m config active_window_border_color $GREEN > /dev/null 2>&1 &
  #       elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
  #         args+=(--set $NAME icon=$YABAI_PARENT_ZOOM icon.color=$BLUE)
  #         yabai -m config active_window_border_color $BLUE > /dev/null 2>&1 &
  #       else
  #         args+=(--set $NAME icon=$YABAI_GRID icon.color=$ORANGE)
  #         yabai -m config active_window_border_color $WHITE > /dev/null 2>&1 &
  #       fi
  #       ;;
  #     "true")
  #       args+=(--set $NAME icon=$YABAI_FLOAT icon.color=$MAGENTA)
  #       yabai -m config active_window_border_color $MAGENTA > /dev/null 2>&1 &
  #       ;;
  #   esac
  fi

  # sketchybar -m "${args[@]}"
  sketchybar -m ":linear:"
}

windows_on_spaces () {
  # CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

  # args=()
  # while read -r line
  # do
  #   for space in $line
  #   do
  #     icon_strip=" "
  #     apps=$(yabai -m query --windows --space $space | jq -r ".[].app")
  #     if [ "$apps" != "" ]; then
  #       while IFS= read -r app; do
  #         icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
  #       done <<< "$apps"
  #     fi
  #     args+=(--set space.$space label="$icon_strip" label.drawing=on)
  #   done
  # done <<< "$CURRENT_SPACES"

  # sketchybar -m "${args[@]}" 


  # Get the list of workspaces using Aerospace
  CURRENT_WORKSPACES=$(aerospace list-workspaces)

  args=()

  while read -r workspace
  do
    icon_strip=" "

    # List windows in the current workspace
    apps=$(aerospace list-windows --workspace "$workspace")
    
    # If there are any windows in this workspace
    if [ -n "$apps" ]; then
      while IFS= read -r app; do
        # Map the app to an icon using the icon_map.sh script
        icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
      done <<< "$apps"
    fi

    # Set the label for this workspace with the icon strip
    args+=(--set workspace.$workspace label="$icon_strip" label.drawing=on)
  done <<< "$CURRENT_WORKSPACES"

  # Update SketchyBar with the new workspace labels
  sketchybar -m "${args[@]}"
  sketcybar -m ":terminal:"
}

mouse_clicked() {
  # yabai -m window --toggle float
  sketcybar -m ":finder:"
  window_state
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "forced") exit 0
  ;;
  "window_focus") window_state 
  ;;
  "windows_on_spaces") windows_on_spaces
  ;;
esac
