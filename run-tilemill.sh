#!/bin/bash

# TILEMILL_HOST needs to be set approp. for client ajax requests
if [[ -z "$TILEMILL_HOST" ]]
then
    TILEMILL_HOST=`ifconfig eth0 | grep 'inet addr:'| cut -d: -f2 | awk '{ print $1}'`
fi

/tilemill/index.js --server=true --listenHost=0.0.0.0 --coreUrl=${TILEMILL_HOST}:20009 --tileUrl=${TILEMILL_HOST}:20008
