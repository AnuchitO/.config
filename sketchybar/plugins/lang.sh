#!/bin/bash

# Get current input source using osascript for better reliability
INPUT_SOURCE=$(osascript -e 'tell application "System Events" to get name of first input source whose selected is true' 2>/dev/null)

# If osascript fails, try using defaults
if [ -z "$INPUT_SOURCE" ]; then
    INPUT_SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -w "KeyboardLayout Name" | cut -d '=' -f2 | tr -d ' ;"' | head -1)
fi

# For some input sources, you might want to show a shorter name
case "$INPUT_SOURCE" in
    "U.S." | "U.S. International - PC" | "com.apple.keylayout.US" | "com.apple.keylayout.USInternational-PC" | "U.S. International")
        SHORT_NAME="US"
        ;;
    "Thai" | "Thai - Thai" | "com.apple.inputmethod.Thailimse" | "com.apple.keylayout.Thai" | "Thai - Thai")
        SHORT_NAME="TH"
        ;;
    *)
        # Extract just the last part of the input source if it's a bundle ID
        SHORT_NAME=$(echo "$INPUT_SOURCE" | awk -F. '{print $NF}')
        [ -z "$SHORT_NAME" ] && SHORT_NAME="??"
        ;;
esac

# Always use the hardcoded item name to ensure it works
sketchybar --set lang label="$SHORT_NAME"
