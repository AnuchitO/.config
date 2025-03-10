#!/bin/bash

# Configuration constants (replace these with actual values from your Lua settings)
ICON=""  # Example RAM icon (replace with your `icons.ram` value)
BLUE="0xff0000ff"   # Example hex color for blue
YELLOW="0xffffff00" # Example hex color for yellow
ORANGE="0xffffa500" # Example hex color for orange
RED="0xffff0000"    # Example hex color for red
BG1="0xff1e1e2e"    # Example background color (replace with `colors.bg1`)
FONT="$FONT:Bold:9.0"  # Replace with your `settings.font.numbers` and style
PADDINGS=6          # Replace with `settings.paddings + 6`
GROUP_PADDINGS=10   # Replace with `settings.group_paddings`
UPDATE_FREQ=5       # Update frequency in seconds (matches Lua's `update_freq`)

# Add the RAM graph item
sketchybar --add graph ram right 42 \
           --set ram graph.color="$BLUE" \
                    background.height=22 \
                    background.color=0x00 \
                    background.border_color=0x00 \
                    background.drawing=on \
                    icon="$ICON" \
                    label="ram ??%" \
                    label.font="$FONT" \
                    label.align=right \
                    label.padding_right=0 \
                    label.width=0 \
                    label.y_offset=4 \
                    padding_right="$PADDINGS" \
                    update_freq="$UPDATE_FREQ" \
                    updates=on

# Add the bracket (group background)
sketchybar --add bracket ram_bracket ram \
           --set ram_bracket background.color="$BG1"

# Add padding item
sketchybar --add item ram_padding right \
           --set ram_padding width="$GROUP_PADDINGS"

# Function to update RAM usage
update_ram() {
    # Get memory pressure info (similar to Lua's `memory_pressure` command)
    MEMORY_INFO=$(memory_pressure | grep "System-wide memory free percentage")
    PERCENTAGE=$(echo "$MEMORY_INFO" | awk '{print $5}' | tr -d '%')
    LOAD=$((100 - PERCENTAGE))

    # Determine color based on load
    if [ "$LOAD" -gt 80 ]; then
        COLOR="$RED"
    elif [ "$LOAD" -gt 60 ]; then
        COLOR="$ORANGE"
    elif [ "$LOAD" -gt 30 ]; then
        COLOR="$YELLOW"
    else
        COLOR="$BLUE"
    fi

    # Push the load value to the graph (normalized to 0-1 range)
    LOAD_NORMALIZED=$(echo "scale=2; $LOAD / 100" | bc)
    sketchybar --push ram "$LOAD_NORMALIZED" \
               --set ram graph.color="$COLOR" \
                        label="ram $LOAD%"
}

# Subscribe to updates (loop to simulate Lua's subscribe behavior)
while true; do
    update_ram
    sleep "$UPDATE_FREQ"
done