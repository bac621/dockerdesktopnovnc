# dockerdesktopnovnc
This is an Ubuntu 16.04 desktop with XFCE4 and NOVNC in a docker container.

## Instructions
### Obtaining the docker image
If you want to build it yourself.

```
git clone https://github.com/atomney/dockerdesktopnovnc.git
cd dockerdesktopnovnc
docker build -t atomney/dockerdesktopnovnc .
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


