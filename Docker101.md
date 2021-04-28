
# Where to get/install Docker
1. [Windows](https://docs.docker.com/docker-for-windows/install/)
1. [Mac](https://docs.docker.com/docker-for-mac/install/)

## Docker Engine proxy - needed to be modified for Artifactory

Open Docker, select Docker Engine config, edit/update below, restart Docker:
~~~
{
  "registry-mirrors": [
    "http://artifacts-scm.XXXX.net:9001"
  ],
  "insecure-registries": [
    "artifacts-scm.XXXX.net:9001"
  ],
  "debug": true,
  "experimental": false
}
~~~

# Not required, but nice to have ... login for Docker Hub
1. [Docker Hub](https://hub.docker.com/)

Docker hub allows you to 'pull' images from hub.docker.com

Some caution: try to see the number of installs an image has before pulling this local. Many docker images are from reputable sources, some *may* not be reputable.

assuming you have a login and have installed Docker
~~~
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: *******
Password: *******
Login Succeeded
$ 
~~~
# So you want to run a /bin/sh in Docker ...
kudos to  for showing me some of these tricks!

use command below, it will have a bash shell running in a container in your desktop ... you can try simple stuff like:
(note: -it, tells docker to run interactive, --rm, docker to clean up cache after running image)
~~~
$ docker run -it --rm python:3.8-slim /bin/sh
# echo $HOME
/root
# id
uid=0(root) gid=0(root) groups=0(root)
# pwd
/
# echo $PATH
/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# which python
/usr/local/bin/python
# python --version
Python 3.8.8
# exit
~~~
- note: the --rm will clean up on exit.

# Map external resources for Docker Apps to reference from inside the container.
1. Applications reference files under the $HOME directory, below is an example: <br>
the -v <external_path>:<internal_path> allows you to map paths external to the container as an internal path. you can also specify several mappings with additional '-v' flags as below:
~~~
# below will map a $HOME directory as /root

$ docker run -v /Users/dtXXXX:/root -v /var/log:/apps/log pyfwa

~~~

the above command "-v /Users/dtXXX:/root" maps my laptop drive "/Users/dtXXXX" as "/root" (external file is mapped for internal directory of container) since we expect some 'hidden' files under $HOME/.pg_service.conf

This may take a moment to sink in ... you are mapping an *external* directory to the *internal container directory* so you can referernces files from it. The above example maps my $HOME directory so the container can reference typical linux run command (rc files). 

This is pure brilliance on Dockers behalf ... absolutely beautiful!

# Your packaged Application in the Docker container has some 'issues' ...
~~~
$ docker run -it --entrypoint /bin/bash pyfwa
root@75c6f509a5ce:/app# 
~~~
shazam! you now have a bash shell inside your container ... you can do your normal investigation to make sure things are correct

# Running images locally from hub.docker.com

1. create yourself a login to http://hub.docker.com
1. use these credentials on your local docker install
~~~
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: ***********
Password: ***********
Login Succeeded
$
~~~
1. pull an ubuntu image from http://hub.docker.com
~~~
$ docker run -it ubuntu bash
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
a70d879fa598: Already exists 
c4394a92d1f8: Already exists 
10e6159c56c0: Already exists 
Digest: sha256:3c9c713e0979e9bd6061ed52ac1e9e1f246c9495aa063619d9d695fb8039aa1f
Status: Downloaded newer image for ubuntu:latest
root@35ae3dc6762c:/# id
uid=0(root) gid=0(root) groups=0(root)
root@35ae3dc6762c:/# uname -a
Linux 35ae3dc6762c 4.19.121-linuxkit #1 SMP Thu Jan 21 15:36:34 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
~~~
1. remove the docker ubuntu you just pulled locally
~~~
$ docker rmi --force ubuntu
Untagged: ubuntu:latest
Untagged: ubuntu@sha256:3c9c713e0979e9bd6061ed52ac1e9e1f246c9495aa063619d9d695fb8039aa1f
Deleted: sha256:26b77e58432b01665d7e876248c9056fa58bf4a7ab82576a024f5cf3dac146d6
~~~
1. pull an ubuntu image from http://hub.docker.com, run it, then remove it from local cache
~~~
$ docker run -it --rm ubuntu bash
root@8281697573cb:/# exit
~~~

# Lets run rstudio locally with image from docker hub ...
below command will:
1. grab the most current version of rstudio
1. instantiate rstudio on your desktop
1. after download completes, open browser http://127.0.0.1:8787 ... user: rstudio/fun
~~~
$ docker run -e PASSWORD=fun -p 8787:8787 rocker/rstudio
~~~
if you want to clean up cache after docker run, use '--rm' flag
~~~
$ docker run --rm -e PASSWORD=fun -p 8787:8787 rocker/rstudio
~~~

# simple Dockerfile commands
| command | description |
| ------ | ------ |
| FROM: |Describes an existing Docker image to start building from. You can start from ‘scratch’, but will usually start from a basic image like the Ubuntu machine we have used above. |
| RUN: | Runs a command as you would at the shell. This creates a Docker layer in the image (See Dockerfile instructions for more on this). |
| LABLE: | Allows you to add metadata to your image in a “key=value” format. |
| EXPOSE: | Indicates specific ports to be listened to. |
| ENV: | Allows you to set environment variables. |
| ADD: | Allows you to copy files into the container when it is built |
| COPY: | Allows you to copy files into the contain when it is built (See Dockerfile for the subtle differences between ADD and COPY behavior). |
| ENTRYPOINT: | Specifies a specific application to run when the container is run. See also Dockerfile for the differences between this and a similar instruction “CMD”. |
