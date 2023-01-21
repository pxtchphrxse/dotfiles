#!/usr/bin/env sh

sketchybar -m --add item layout right \
    --set layout update_freq=1 \
    script="$PLUGIN_DIR/im-select.sh" \
    label.color=0xFFFFFFFF \
    label.font="JetBrains Mono:BOLD:13.0" \
    background.color=0xFF000000 \
    background.height=24 \
    background.corner_radius=4 \
    label.padding_left=0 \
    label.padding_right=9
