#!/bin/sh

sketchybar --add alias "iStat Menus Status,com.bjango.istatmenus.memory" right \
  --set "iStat Menus Status,com.bjango.istatmenus.memory"\
  alias.update_freq=2 \
  label.drawing=off \
  icon="" \
  icon.font.size=16.0 \
  icon.padding_left=8 \
  icon.padding_right=-4 \
  background.height=24 \
  background.corner_radius=4 \
  background.color=0xFFd81b60
# sketchybar -m --add item mem right \
#               --set mem update_freq=2 \
#                     script="$PLUGIN_DIR/mem.sh" \
#                     icon=􀫦 \
#                     icon.color=0xFFFFFFFF \
#                     label.color=0xFFFFFFFF \
#                     label.font="JetBrains Mono:BOLD:13.0" \
#                     background.color=0xFFd81b60 \
#                     background.height=24 \
#                     background.corner_radius=4 \
#                     icon.padding_left=8 \
#                     label.padding_right=8
