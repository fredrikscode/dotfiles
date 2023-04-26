#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run "feh" --randomize --bg-fill ~/.config/wallpapers/
run "$HOME/.config/polybar/launch.sh"
run "picom"
