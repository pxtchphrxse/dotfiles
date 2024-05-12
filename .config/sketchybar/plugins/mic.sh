#!/bin/sh
# require nowplaying-cli (https://github.com/kirtan-shah/nowplaying-cli.git)

toggle() {
	volume=$(osascript -e 'input volume of (get volume settings)')
	if [[ "$volume" = "0" ]]; then
		osascript -e 'set volume input volume 100'
		sketchybar --set mic icon="󰍬"
	else
		osascript -e 'set volume input volume 0'
		sketchybar --set mic icon="󰍭"
	fi
}

update() {
	volume=$(osascript -e 'input volume of (get volume settings)')
	if [[ "$volume" = "0" ]]; then
		sketchybar --set mic icon="󰍭"
	else
		sketchybar --set mic icon="󰍬"
	fi
}

case "$SENDER" in
"mouse.clicked")
	toggle
	;;
"toggle_mic")
	toggle
	;;
*)
	update
	;;
esac
