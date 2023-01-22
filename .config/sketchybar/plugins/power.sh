#!/bin/bash

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

COLOR=white
BATTERY_100=􀛨
BATTERY_75=􀺸
BATTERY_50=􀺶
BATTERY_25=􀛩
BATTERY_0=􀛪
BATTERY_CHARGING=􀢋

case ${BATT_PERCENT} in
    9[0-9]|100) ICON=$BATTERY_100 ;;
    [6-8][0-9]) ICON=$BATTERY_75 ;;
    [3-5][0-9]) ICON=$BATTERY_50 ;;
    [1-2][0-9]) ICON=$BATTERY_25; COLOR=$ORANGE ;;
    *) ICON=$BATTERY_0; COLOR=$RED
esac

if [[ ${CHARGING} != "" ]]; then
    ICON="${BATTERY_CHARGING}"
fi

sketchybar --set ${NAME} icon="${ICON}"
sketchybar --set ${NAME} label="${BATT_PERCENT}%"
