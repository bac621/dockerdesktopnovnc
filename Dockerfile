FROM ubuntu:xenial
MAINTAINER atomney <atomney+docker@gmail.com>

# Tell APT that humans aren't going to answer package questions
ENV DEBIAN_FRONTEND noninteractive

# Copy vnc start script into root of container
ADD startup.sh /startup.sh

# Update and install packages and remove apt proxy file and default desktop image
RUN apt-get update -y && \
    apt-get install -y git net-tools x11vnc wget python python-numpy unzip xvfb firefox lxde menu mtr terminator htop tmux screen iperf$
    cd /root && git clone https://github.com/kanaka/noVNC.git && \
    cd /root && \
    chmod 0755 /startup.sh && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Set the script to run on container launch
CMD /startup.sh

# Expose the noVNC port
EXPOSE 6080
