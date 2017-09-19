#!/usr/bin/env bash
/usr/bin/xrandr --auto
/usr/bin/xrandr --output VGA-1 --off
/usr/bin/xrandr --output DVI-I-1 --primary 
/usr/bin/xrandr --output VGA-1 --mode 1440x900 --left-of DVI-I-1
