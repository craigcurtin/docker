

automatically remove dangling Docker images and other resources on a daily basis for Linux, Windows and MacOS.
We’ll want to automatically execute this command every day at 3AM,

crontab -e

0 3 * * * /usr/bin/docker system prune -af

-a  Remove all unused images not just dangling ones

-f  Do not prompt for confirmation


=======

Docker Command Line

https://docs.docker.com/engine/reference/commandline/docker/

Docker Tip #32: Automatically Clean Up after Docker Daily
https://nickjanetakis.com/blog/docker-tip-32-automatically-clean-up-after-docker-daily



Setting Up Docker for Windows and WSL to Work Flawlessly
https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly



Docker CMD vs Entrypoint Commands: What's the Difference?
https://phoenixnap.com/kb/docker-cmd-vs-entrypoint

Docker Tip #2: The Difference between COPY and ADD in a Dockerfile
https://nickjanetakis.com/blog/docker-tip-2-the-difference-between-copy-and-add-in-a-dockerile



Containers are designed for running specific tasks and processes, not for hosting operating systems. You create a container to serve a single unit task. Once it completes the given task, it stops. Therefore, the container life-cycle depends on the ongoing process inside of it. Once the process stops, the container stops as well.

A Dockerfile defines this process. It is a script made up of instructions on how to build a Docker image. In this script, there are two types of instructions that can define the process running in the container:

ENTRYPOINT
CMD


In short, CMD defines default commands and/or parameters for a container. CMD is an instruction that is best to use if you need a default command which users can easily override.

There is a way to override the ENTRYPOINT instruction - you need to add the --entrypoint flag prior to the container_name when running the command.



Docker ENTRYPOINT and CMD can have two forms:

Shell form
Exec form


CMD echo “Hello World” (shell form)
CMD ["echo", "Hello World"] (exec form)
ENTRYPOINT echo "Hello World" (shell form)
ENTRYPOINT ["echo", "Hello World"] (exec form)


However, try to keep all your instructions in exec form to prevent potential performance issues.

Docker Entrypoint with CMD
There are many situations in which combining CMD and ENTRYPOINT would be the best solution for your Docker container. In such cases, the executable is defined with ENTRYPOINT, while CMD specifies the default parameter.

If you are using both instructions, make sure to keep them in exec form.


How to run multiple commands in docker at once

https://www.edureka.co/community/10736/how-to-run-multiple-commands-in-docker-at-once


https://stackoverflow.com/questions/46797348/docker-cmd-exec-form-for-multiple-command-execution


docker install

https://nickjanetakis.com/blog/understanding-how-the-docker-daemon-and-docker-cli-work-together

docker client
docker engine

To list all running Docker containers, enter the following into a terminal window:

docker ps


To list all containers, both running and stopped, add –a :

docker ps –a


Command – The command that launched the container
Ports – Specifies any ports forwarded to the container for networking
docker search tomcat

docker pull hello-world



To create a new container from an image and start it, use docker run
docker run hello-world



to launch or start a single or multiple stopped Docker containers is docker start:

docker start [options] container_id 

Use the docker stop command to stop a container


remove images
docker rmi <image name>


list all the images available locally on the system

docker images


creates a new container named "myhttpd" from the centos:7 image and runs the bash shell command in the container.


A container may be running, but you may not be able to interact with it. To start the container in interactive mode,
docker run -it --name myhttpd centos:7 /bin/bash

yum install httpd
exit  (exit and stop docker)


The “docker commit” command saves the changes to a new image.


docker commit -m="CentOS 7 With httpd installed" myhttpd centos7/httpd:1.0.0

docker start myhttpd

docker exec -it myhttpd /bin/bash
Creating an Image from a Container
You can save the current state of a container as a new image by using the “docker commit” command. This is useful if you have modified a container and want to commit the changes to a new image for later use.


A Docker container is a fully-contained virtual machine.

This guide will show you three methods to SSH into a Docker container and run commands



.

To get access and run commands in that Docker container, type the following:

sudo docker exec –it nginx-test /bin/bash


The –i option specifies interactive, and the –t enables a terminal typing interface.

docker attach nginx-test


You can get a list of all containers by invoking the docker container ls command with the -a option:

docker container ls -a
docker container rm
docker container prune (remove all container)


======================
Removing All Unused Objects
The docker system prune command removes all stopped containers, dangling images, and unused networks:

docker system prune



