# Docker-nzbget

A nice and easy way to get a nzbclient running using docker. For help
on getting started with docker see the [official getting started guide][0].
For more information about nzbget see the [official nzbget page][1].

## Building docker-nzbget

Running this will build you a docker images with the latest version of both
docker-nzbget and nzbget itself.

    docker build -rm -t apps/nzbget \
      https://github.com/hvanderlaan/docker-nzbget.git

Or if you don't trust me clone the repo and build the docker image from there.

    git clone https://github.com/hvanderlaan/docker-nzbget
    cd docker-nzbget
    docker build -rm -t apps/nzbget .

When you build the images it's best to create a data directory where your downloads
will be saved.

    cd docker-nzbget
    mkdir data

## Running docker-nzbget

Running the first time you need to set your port to a static port of your choice
so that you can easily map a proxy to it. If this is the only thing running in your
system you can map the port to 6789 and no proxy is needed.

    docker run --name nzbget -d -p 6789:6789 \
      -v /opt/docker/docker-nzbget/data:/data apps/nzbget

From now on when you start/stop docker-nzbget you should use the container id
with the following commands. To get your container id, after you initial run
type `sudo docker ps` and it will show up on the left side followed by the
image name which is `gameserver/nzbget:latest`.

    docker stop nzbget
    docker start nzbget

Now we can connect to nzbget webgui by entering the following url in your browser
http://localhost:6789 or by [following this link][2]. The nzbget webgui will ask for
an username and password.

    username: docker-nzbget
    password: docker-nzbget
 
### Notes on the run command

 + `-v` is the volume you are mounting `-v host_dir:docker_dir`
 + `apps/nzbget` is simply what I called my docker build of this image
 + `-d` allows this to run cleanly as a daemon, remove for debugging
 + `-p` is the port it connects to, `-p host_port:docker_port



[0]: http://www.docker.io/gettingstarted/
[1]: http://www.nzbget.net
[2]: http://localhost:6789/
