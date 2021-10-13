#!/bin/sh

nitrogen --restore &
dunst &
picom &
sxhkd &
xrandr --output HDMI1 --auto --scale 1.32 --right-of eDP1

setxkbmap -option caps:escape

dwmblocks &

while true; do
    dwm >/dev/null 2>&1
done
