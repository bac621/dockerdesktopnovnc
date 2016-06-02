FROM ubuntu:trusty
MAINTAINER atomney <atomney+docker@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD startup.sh /startup.sh
COPY 02proxy /etc/apt/apt.conf.d/02proxy

RUN apt-get update -y && \
    apt-get install -y git x11vnc wget python python-numpy unzip xvfb firefox lxde geany menu mtr terminator htop tmux$
    cd /root && git clone https://github.com/kanaka/noVNC.git && \
    cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify && \
    cd /root && \
    chmod 0755 /startup.sh && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm /etc/apt/apt.conf.d/02proxy \
    rm /usr/share/lxde/wallpapers/lxde_blue.jpg \
    rm -rf /var/lib/apt/lists/*

COPY lxde_blue.jpg /usr/share/lxde/wallpapers/lxde_blue.jpg
CMD /startup.sh
EXPOSE 6080
