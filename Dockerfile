# Docker image for tilemill

FROM ubuntu:14.04
MAINTAINER Chris Natali

RUN apt-get update && \ 
    apt-get -y install git nodejs-legacy npm

# install tilemill
RUN git clone https://github.com/mapbox/tilemill.git

WORKDIR /tilemill
RUN npm install

# hack
WORKDIR /tilemill/node_modules/connect
RUN npm uninstall qs
RUN npm install qs@5.2
WORKDIR /tilemill

ADD run-tilemill.sh /tilemill/
