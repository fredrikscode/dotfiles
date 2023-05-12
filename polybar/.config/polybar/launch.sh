#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
#polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

echo "---" | tee -a /tmp/polybar_main.log /tmp/polybar_left.log /tmp/polybar_right.log
polybar main 2>&1 | tee -a /tmp/polybar_main.log & disown
polybar left 2>&1 | tee -a /tmp/polybar_left.log & disown
polybar right 2>&1 | tee -a /tmp/polybar_right.log & disown