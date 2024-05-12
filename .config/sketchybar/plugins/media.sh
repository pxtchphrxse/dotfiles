#!/bin/sh
# require nowplaying-cli (https://github.com/kirtan-shah/nowplaying-cli.git)

next() {
    nowplaying-cli next
}
back() {
    nowplaying-cli back
}
play() {
    nowplaying-cli togglePlayPause
}

update() {
    PLAYBACK_RATE=$(nowplaying-cli get playbackRate)
    if [ $PLAYBACK_RATE = 1 ]
    then
        sketchybar --set music.play icon="󰏤" icon.font.size=19.0
    else
        sketchybar --set music.play icon="" icon.font.size=14.0
    fi

    TRACK_NAME=$(echo $INFO | jq -r ".title")
    TRACK_ARTIST=$(echo $INFO | jq -r ".artist")
    if [[ "$TRACK_NAME" = "null" || $TRACK_ARTIST = "" ]]
    then
        PLAYER_LABEL=""
        sketchybar --set music.play label="$PLAYER_LABEL" label.padding_right=0
        return
    else
        if [[ "$TRACK_ARTIST" = "null" || "$TRACK_ARTIST" = "" ]]
        then
            PLAYER_LABEL="$TRACK_NAME"
        elif [[ "$TRACK_NAME" = "null" || "$TRACK_NAME" = "" ]]
        then
            PLAYER_LABEL="$TRACK_ARTIST"
        else
            PLAYER_LABEL="$TRACK_NAME - $TRACK_ARTIST"
        fi
        sketchybar --set music.play label="$PLAYER_LABEL" label.padding_right=8
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
