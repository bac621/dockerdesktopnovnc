FROM ubuntu:trusty
MAINTAINER atomney <atomney+docker@gmail.com>

# Tell APT that humans aren't going to answer package questions
ENV DEBIAN_FRONTEND noninteractive

# Copy vnc start script into root of container
ADD startup.sh /startup.sh

# Copy apt proxy file into container
COPY 02proxy /etc/apt/apt.conf.d/02proxy

# Update and install packages and remove apt proxy file and default desktop image
RUN apt-get update -y && \
    apt-get install -y git x11vnc wget python python-numpy unzip xvfb firefox lxde menu mtr terminator htop tmux screen iperf snmp zenmap telnet dnsutils filezilla netcat wireshark curl && \
    cd /root && git clone https://github.com/kanaka/noVNC.git && \
    cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify && \
    cd /root && \
    chmod 0755 /startup.sh && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm /etc/apt/apt.conf.d/02proxy \
    rm /usr/share/lxde/wallpapers/lxde_blue.jpg \
    rm -rf /var/lib/apt/lists/*

# Copy new desktop background into container in place of the one that was removed
COPY lxde_blue.jpg /usr/share/lxde/wallpapers/lxde_blue.jpg

# Set the script to run on container launch
CMD /startup.sh

# Expose the noVNC port
EXPOSE 6080
