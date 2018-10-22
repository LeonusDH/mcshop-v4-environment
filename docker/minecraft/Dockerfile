# Minecraft 1.11 Dockerfile - Example with notes

# Use the offical Debian Docker image with a specified version tag, Jessie, so not all
# versions of Debian images are downloaded.
FROM debian:jessie

MAINTAINER Aleksandr Kvintilyanov <bednyj.mops@gmail.com>

# Drives which version we are going to install
ENV MINECRAFT_VERSION 1.12.2

# Sets working directory for the CMD instruction (also works for RUN, ENTRYPOINT commands)
WORKDIR "/application/"

RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list; \
    apt-get -y update; \
    apt-get install -y -t jessie-backports openjdk-8-jre-headless ca-certificates-java;

RUN apt-get -y update; \
    apt-get install -y curl unzip screen;\
    mkdir /minecraft_server;

RUN curl -o /minecraft_server/spigot${MINECRAFT_VERSION}.zip https://launcher.sashok724.net/download/servers/spigot${MINECRAFT_VERSION}.zip

RUN cd /minecraft_server; \
    unzip spigot${MINECRAFT_VERSION}.zip; \
    rm spigot${MINECRAFT_VERSION}.zip


RUN mkdir /minecraft_launch_server; \
    curl -o /minecraft_launch_server/setup.sh https://launcher.sashok724.net/download/setup.sh

RUN cd /minecraft_launch_server; \
    mkdir profiles; \
    curl -o ./profiles/profile${MINECRAFT_VERSION}.cfg https://raw.githubusercontent.com/new-sashok724/Launcher/master/LaunchServer/resources/launchserver/defaults/profile${MINECRAFT_VERSION}.cfg ; \
    sh setup.sh

RUN apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY LaunchServer.cfg /minecraft_launch_server/

# Expose the container's network port: 25565 during runtime.
EXPOSE 25565
EXPOSE 7240

#Automatically accept Minecraft EULA, and start Minecraft server
CMD tail -f /dev/null