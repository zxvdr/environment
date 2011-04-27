#!/bin/bash

#xrdb -merge ~/.Xresources
xsetroot -solid black &
/usr/bin/stalonetray &

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi
 
if [ -x /usr/bin/gnome-power-manager ] ; then
   #sleep 3
   gnome-power-manager &
fi

eval `ssh-agent` &
gnome-screensaver &
bluetooth-applet &
/usr/bin/gnome-volume-control-applet &
#seahorse-daemon &

exec /usr/bin/xmonad
