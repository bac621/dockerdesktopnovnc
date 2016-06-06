# dockerdesktopnovnc
This is an Ubuntu 16.04 desktop with LXDE and NOVNC in a docker container.

## Instructions
### Obtaining the docker image
If you want to build it yourself.

```
git clone https://github.com/atomney/dockerdesktopnovnc.git
cd dockerdesktopnovnc
docker build -t atomney/dockerdesktopnovnc .
```

I use an apt cache so my rebuilds go faster. If you are using one, you will need to modify the 02proxy file and replace the word "aptcache" with the hostname or IP or your apt cache server.

If you use an apt cache you will need to uncomment the following line in the 02proxy file
```
#Acquire::http { Proxy "http://aptcache:3142"; };
```



You can also pull it without building by

```
docker pull atomney/dockerdesktopnovnc
```

### Running the docker image



```
docker run -td -v /etc/localtime:/etc/localtime:ro -p 80:6080 atomney/dockerdesktopnovnc
```


There is also an included script that contains the above command.
```
chmod +x StartDockerDesktopNOVNC.sh
./StartDockerDesktopNOVNC.sh
```


### Accessing the noVNC interface
If you used my start script for your container, it will be listening on port 80
Just point your browser at:

http://yourdockerhost


