sketchybar \
	--add event toggle_mic \
	--add item mic center \
	--set mic \
	icon.color=0xFF000000 \
	icon="󰍬" \
	icon.font.size=16.0 \
	background.color=0xFFFFFFFF \
	background.height=24 \
	background.corner_radius=4 \
	icon.padding_left=8 \
	update_freq=10 \
	script="$PLUGIN_DIR/mic.sh" \
	--subscribe mic toggle_mic mouse.clicked
