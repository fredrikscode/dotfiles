#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run "feh" --randomize --bg-fill ~/.wallpapers/3840x1600
run "$HOME/.config/polybar/launch.sh"
run "picom"
#run "/usr/bin/dunst -conf $HOME/.config/dunst/dunstrc"