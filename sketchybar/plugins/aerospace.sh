#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# Debug
#echo "$(date): Running script for workspace $1 : $NAME"
#echo "$(date): Focused workspace is $FOCUSED_WORKSPACE : $NAME"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi