#!/bin/sh

sketchybar \
    --add item music.back center \
    --set music.back  \
    icon.color=0xFF000000 \
    icon=􀊊 \
    background.color=0xFFFFFFFF \
    background.height=24 \
    background.corner_radius=4 \
    icon.padding_left=8 \
    script="$PLUGIN_DIR/media.sh" \
    --subscribe music.back mouse.clicked

sketchybar \
    --add item music.play center \
    --set music.play  \
    icon.color=0xFF000000 \
    icon=􀊄 \
    label.color=0xFF000000 \
    label.font="JetBrains Mono:BOLD:13.0" \
    script="$PLUGIN_DIR/media.sh" \
    update_freq=1 \
    background.color=0xFFFFFFFF \
    background.height=24 \
    background.corner_radius=4 \
    icon.padding_left=8 \
    icon.padding_right=6 \
    --subscribe music.play mouse.clicked


sketchybar \
    --add item music.next center \
    --set music.next  \
    icon.color=0xFF000000 \
    icon=􀊌 \
    background.color=0xFFFFFFFF \
    background.height=24 \
    background.corner_radius=4 \
    icon.padding_left=8 \
    script="$PLUGIN_DIR/media.sh" \
    --subscribe music.next mouse.clicked
