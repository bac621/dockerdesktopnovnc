#!/bin/bash

########## VARIABLES

# NAMES
D1NAME=D1
D2NAME=D2

# PORTS
D1PORT=172.17.0.1:5901
D2PORT=172.17.0.1:5902

# MEMORY FOR EACH DESKTOP
MEMORY=512m

if [ "$1" = "--d1" ]; then

        docker run -td -v /etc/localtime:/etc/localtime:ro -p $D1PORT:5900 --name $D1NAME -m $MEMORY atomney/dockerdesktopnovnc
fi

if [ "$1" = "--d2" ]; then

        docker run -td -v /etc/localtime:/etc/localtime:ro -p $D2PORT:5900 --name $D2NAME -m $MEMORY atomney/dockerdesktopnovnc
fi

if [ "$1" = "--all" ]; then

        bash $0 --d1
        bash $0 --d2
fi

if [ "$1" = "--remove" ]; then

        docker stop $D1NAME
        docker stop $D2NAME
        docker rm $D1NAME
        docker rm $D2NAME
fi

if [ "$1" = "--pull" ]; then

        docker pull atomney/dockerdesktopnovnc
        bash $0 --remove
        bash $0 --all
fi
