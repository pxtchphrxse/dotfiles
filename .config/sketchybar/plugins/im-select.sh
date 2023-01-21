#!/bin/bash

KEYBOARD_LAYOUT=$(im-select | grep -Eo "\w+$")

sketchybar --set ${NAME} label="${KEYBOARD_LAYOUT}"
