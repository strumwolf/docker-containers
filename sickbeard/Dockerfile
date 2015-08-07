FROM phusion/baseimage:0.9.17
MAINTAINER strumwolf <lightsabre13@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"

# Fix timezone
RUN echo "America/New_York" > /etc/timezone && dpkg-reconfigure tzdata

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Add repositories
RUN echo 'deb http://ppa.launchpad.net/git-core/ppa/ubuntu precise main' > /etc/apt/sources.list.d/git.list;\
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E1DF1F24;\
    apt-get update;\
    apt-get -y upgrade;

# Install Dependencies
RUN apt-get install -y python python-cheetah ca-certificates wget unrar unzip git

# Create user sickbeard
RUN adduser --disabled-login --gecos 'sickbeard' sickbeard

# Install SickBeard
RUN mkdir /opt/sickbeard;\
    git clone https://github.com/midgetspy/Sick-Beard.git /opt/sickbeard;\
    chown -R sickbeard /opt/sickbeard;

EXPOSE 8081

# SickBeard Configuration
VOLUME /config

# Downloads directory
VOLUME /downloads

# TV directory
VOLUME /tv

# Add mount.sh to execute during container startup
ADD mount.sh /etc/my_init.d/mount.sh

# Add Sickbeard to runit
RUN mkdir /etc/service/sickbeard
ADD sickbeard.sh /etc/service/sickbeard/run
RUN chmod +x /etc/service/sickbeard/run
#CMD ["tail", "-f", "/etc/passwd"]