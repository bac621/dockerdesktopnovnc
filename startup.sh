#!/bin/bash

## Explanation of steps
# Tell it what display to use
# Create the new display using xvfb
# Wait 5 seconds
# Start LXDE
# Start VNC Server

export DISPLAY=:1
Xvfb :1 -screen 0 1600x900x16 &
sleep 5
startlxde&
x11vnc -display :1 -nopw -xkb -ncache_cr -forever -shared &
cd /root/noVNC && ln -s vnc.html index.html && ./utils/launch.sh --web /root/noVNC --vnc localhost:5900
