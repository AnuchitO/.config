#!/bin/bash

# Add the item with a red background for visibility
sketchybar --add item lang right \
           --set lang \
                 icon=keyboard \
                 icon.font="$FONT:Black:14.0" \
                 icon.color=0xffffffff \
                 label="??" \
                 label.font="$FONT:Semibold:13.0" \
                 label.color=0xffffffff \
                 background.color=0x44ff0000 \
                 padding_left=10 \
                 padding_right=10 \
                 script="$PLUGIN_DIR/lang.sh" \
                 update_freq=5 \
           --subscribe lang system_woke mouse.clicked
