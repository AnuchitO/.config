#!/bin/bash


sketchybar --add event aerospace_workspace_change

spaces=()
for sid in $(aerospace list-workspaces --all); do
    # sketchybar --add item space.$sid left \
    #     --subscribe space.$sid aerospace_workspace_change \
    #     --set space.$sid \
    #     background.color=0x44ffffff \
    #     background.corner_radius=5 \
    #     background.height=20 \
    #     background.drawing=off \
    #     label="$sid" \
    #     click_script="aerospace workspace $sid" \
    #     script="$CONFIG_DIR/plugins/aerospace.sh $sid"

    # space=(
    #     associated_space=$sid
    #     # icon=$sid
    #     # icon.padding_left=10
    #     # icon.padding_right=15
    #     # padding_left=2
    #     # padding_right=2
    #     # label.padding_right=20
    #     # icon.highlight_color=$RED
    #     # label.font="sketchybar-app-font:Regular:16.0"
    #     label.background.drawing=off
    #     label.background.height=26
    #     label.background.color=$BACKGROUND_2
    #     label.background.corner_radius=8
    #     # label.drawing=off
    #     #label="$sid"
    #     #click_script="aerospace workspace $sid"
    #     #script="$PLUGIN_DIR/aerospace.sh"
    # )

    space=(
        icon.highlight_color=$RED
        icon.padding_left=10
        icon.padding_right=15
        icon="$sid"
        icon.font="$FONT:Bold:16.0"
        label.padding_right=20
        padding_left=2
        padding_right=2

        # label.font="sketchybar-app-font:Regular:16.0"
        label.font="$FONT:Semibold:13.0"
        background.color=$BLACK
        background.corner_radius=8
        background.height=26
        background.drawing=on
        background.drawing=off
        label.background.color=$BACKGROUND_2
        label.background.corner_radius=8
        label.background.height=26
        label.background.drawing=on
        label.drawing=off
        label="$YABAI_FLOAT"
        #click_script="aerospace workspace $sid"
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
    )

    sketchybar --add item space.$sid left    \
               --subscribe space.$sid aerospace_workspace_change \
               --set space.$sid "${space[@]}"

done

# SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15")

# # Destroy space on right click, focus space on left click.
# # New space by left clicking separator (>)

# sid=0
# spaces=()
# for i in "${!SPACE_ICONS[@]}"
# do
#   sid=$(($i+1))

#   space=(
#     associated_space=$sid
#     icon=${SPACE_ICONS[i]}
#     icon.padding_left=10
#     icon.padding_right=15
#     padding_left=2
#     padding_right=2
#     label.padding_right=20
#     icon.highlight_color=$RED
#     label.font="sketchybar-app-font:Regular:16.0"
#     label.background.height=26
#     label.background.drawing=on
#     label.background.color=$BACKGROUND_2
#     label.background.corner_radius=8
#     label.drawing=off
#     script="$PLUGIN_DIR/space.sh"
#   )

#   sketchybar --add space space.$sid left    \
#              --set space.$sid "${space[@]}" \
#              --subscribe space.$sid mouse.clicked
# done

spaces=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
  background.drawing=on
)

separator=(
  icon=􀆊
  icon.font="$FONT:Heavy:16.0"
  padding_left=15
  padding_right=15
  label.drawing=off
  associated_display=active
  click_script='sketchybar --trigger space_change'
  icon.color=$WHITE
)

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces "${spaces[@]}"        \
                                              \
           --add item separator left          \
           --set separator "${separator[@]}"
