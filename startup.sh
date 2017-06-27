#!/bin/bash
echo $VNCPASS | vncpasswd -f > /$HOME/.vnc/passwd &
chmod 600 $HOME/.vnc/passwd &
vncserver :0 -SecurityTypes VncAuth -AcceptSetDesktopSize=1 &
cd /root/noVNC && ln -s vnc.html index.html && ./utils/launch.sh --web /root/noVNC --vnc localhost:5900
