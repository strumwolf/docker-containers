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
RUN apt-get install -y python wget unrar git-core python-lxml

# Create user sickbeard
RUN adduser --disabled-login --gecos 'couchpotato' couchpotato

# Install SickBeard
RUN mkdir /opt/couchpotato;\
    git clone git://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato;\
    chown -R couchpotato /opt/couchpotato;

EXPOSE 5050

# SickBeard Configuration
VOLUME /config

# Downloads directory
VOLUME /downloads

# TV directory
VOLUME /tv

# Add mount.sh to execute during container startup
ADD mount.sh /etc/my_init.d/mount.sh

# Add Sickbeard to runit
RUN mkdir /etc/service/couchpotato
ADD couchpotato.sh /etc/service/couchpotato/run
RUN chmod +x /etc/service/couchpotato/run