#!/bin/sh

next() {
    osascript -e 'tell application "Music" to play next track'
}
back() {
    osascript -e 'tell application "Music" to play previous track'
}
play() {
    osascript -e 'tell application "Music" to playpause'
}

update() {
    PLAYER_STATE=$(osascript -e 'tell application "Music" to get player state')
    PLAYER_ICON=􀊄
    if [ ${PLAYER_STATE} = "stopped" ]
    then
        sketchybar --set music.play label="$PLAYER_LABEL" icon="$PLAYER_ICON" \
            label.padding_right=0
    else
        TRACK_NAME=$(osascript -e 'tell application "Music" to get name of current track')
        TRACK_ARTIST=$(osascript -e 'tell application "Music" to get artist of current track')
        PLAYER_LABEL="$TRACK_NAME - $TRACK_ARTIST"
        if [ ${PLAYER_STATE} = "playing" ]
        then
            PLAYER_ICON=􀊆
        else
            PLAYER_ICON=􀊄
        fi
        sketchybar --set music.play label="$PLAYER_LABEL" icon="$PLAYER_ICON" \
            label.padding_right=8
    fi
}

mouse_clicked () {
    case "$NAME" in
        "music.next") next
            ;;
        "music.back") back
            ;;
        "music.play") play
            ;;
        *) exit
            ;;
    esac
}

routine() {
    case "$NAME" in
        *) update
            ;;
    esac
}

case "$SENDER" in
    "mouse.clicked") mouse_clicked
        ;;
    "routine") routine
        ;;
    *) update
        ;;
esac
