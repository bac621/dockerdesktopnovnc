#!/bin/bash
docker run -td -v /etc/localtime:/etc/localtime:ro -p 80:6080 -p 5900:5900 atomney/dockerdesktopnovnc
