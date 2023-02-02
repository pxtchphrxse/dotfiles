#!/bin/sh

APPLE_MUSIC_EVENT="com.apple.Music.playerInfo"

# sketchybar \
    #     --add       event           apple_music_change $APPLE_MUSIC_EVENT \
    #     --add       item            apple_music center             \
    #     --set       apple_music  script="$PLUGIN_DIR/music.sh"   \
    #     popup.horizontal=on                 \
    #     popup.align=center                  \
    #     popup.height=150                    \
    #     icon=�                              \
    #     icon.font="$FONT:Regular:25.0"      \
    #     label.drawing=off                   \
    #     drawing=off                         \
    #     y_offset=2                          \
    #     --subscribe apple_music apple_music_change
#
sketchybar --add event apple_music_change $APPLE_MUSIC_EVENT

sketchybar \
    --add item music.back center \
    --set music.back  \
    icon.color=0xFF000000 \
    icon=􀊊 \
    background.color=0xFFFFFFFF \
    background.height=24 \
    background.corner_radius=4 \
    icon.padding_left=8 \
    script="$PLUGIN_DIR/music.sh" \
    --subscribe music.back mouse.clicked

sketchybar \
    --add item music.play center \
    --set music.play  \
    icon.color=0xFF000000 \
    icon=􀊄 \
    label.color=0xFF000000 \
    label.font="JetBrains Mono:BOLD:13.0" \
    script="$PLUGIN_DIR/music.sh" \
    updates=on \
    background.color=0xFFFFFFFF \
    background.height=24 \
    background.corner_radius=4 \
    icon.padding_left=8 \
    icon.padding_right=6 \
    --subscribe music.play mouse.clicked apple_music_change


sketchybar \
    --add item music.next center \
    --set music.next  \
    icon.color=0xFF000000 \
    icon=􀊌 \
    background.color=0xFFFFFFFF \
    background.height=24 \
    background.corner_radius=4 \
    icon.padding_left=8 \
    script="$PLUGIN_DIR/music.sh" \
    --subscribe music.next mouse.clicked
