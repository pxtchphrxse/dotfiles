#!/usr/bin/env sh

sketchybar --add item calendar right \
  --set calendar \
  padding_right=-8 \
  icon.drawing=on \
  icon="󰃶" \
  icon.font.size=16.0 \
  icon.color=0xFFFFFFFF \
  icon.padding_left=8 \
  icon.padding_right=0 \
  label.font="JetBrains Mono:BOLD:13.0" \
  label.color=0xFFFFFFFF \
  label.padding_left=6 \
  label.padding_right=8 \
  background.color=0xff1976d2 \
  background.height=24 \
  background.corner_radius=4 \
  background.padding_right=-8 \
  update_freq=10 \
  script="$PLUGIN_DIR/calendar.sh"

# sketchybar --add alias "Control Center,Clock" right \
#            --set "Control Center,Clock" \
#                           icon.drawing=off \
#                           alias.update_freq=10 \
#                           label.max_chars=10 \
#                           label.padding_right=-100 \
#                           align=center \
#                           background.color=0xff1976d2 \
#                           background.height=24 \
#                           background.corner_radius=4 \
#                           background.padding_right=0
