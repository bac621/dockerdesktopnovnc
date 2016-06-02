# dockerdesktopnovnc
This is an Ubuntu 14.04 desktop with LXDE and NOVNC in a docker container.

## Instructions
### Obtaining the docker image
If you want to build it yourself.

```
git clone git@github.com:atomney/dockerdesktopnovnc.git
cd dockerdesktopnovnc
docker build -t atomney/dockerdesktopnovnc .
```

I use an apt cache so my rebuilds go faster. If you are using one, you will need to modify the 02proxy file and replace the word "aptcache" with the hostname or IP or your apt cache server.

If you don't use an apt cache you will need to remove the following two lines from the Docker file
```
COPY 02proxy /etc/apt/apt.conf.d/02proxy
rm /etc/apt/apt.conf.d/02proxy \
```



You can also pull it without building by

```
docker pull atomney/dockerdesktopnovnc
```

### Running the docker image

```
chmod +x StartDockerDesktopNOVNC.sh
./StartDockerDesktopNOVNC.sh
```

### Accessing the noVNC interface
If you used my start script for your container, it will be listening on port 80
Just point your browser at:

http://yourdockerhost


