#!/bin/bash

########## VARIABLES
# HERE
HERE=`pwd`

# CONTAINER NAMES
D1NAME=d1

# PORTS
D1PORT=8080

# VNC PASSWORD
VNCPASS=YOURPASSWORD

# MEMORY FOR EACH DESKTOP
MEMORY=512m

# IMAGE NAME
IMAGENAME=atomney/dockerdesktopnovnc

# START THE CONTAINER
if [ "$1" = "--start" ]; then

 docker run --rm -v /etc/localtime:/etc/localtime:ro -p $D1PORT:6080 \
        -e VNCPASS=$VNCPASS --name $D1NAME -m $MEMORY $IMAGENAME &
fi

# START THE CONTAINER WITH CERT
if [ "$1" = "--startwithcert" ]; then

 docker run --rm -v /etc/localtime:/etc/localtime:ro -p $D1PORT:6080 \
        -v $HERE/self.pem:/root/noVNC/self.pem \
        -e VNCPASS=$VNCPASS --name $D1NAME -m $MEMORY $IMAGENAME &
fi


# STOP AND REMOVE THE CONTAINER
if [ "$1" = "--remove" ]; then

        docker stop $D1NAME
        docker rm $D1NAME
fi

# PULL THE NEWEST CONTAINER IMAGE
if [ "$1" = "--update" ]; then

        docker pull $IMAGENAME
        bash $0 --remove
        bash $0 --start
fi

# GENERATE SELF SIGNED CERT
if [ "$1" = "--cert" ]; then

        openssl req -new -x509 -days 365 -nodes -out self.pem -keyout self.pem
fi
