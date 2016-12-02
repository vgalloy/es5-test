#!/bin/bash

CURRENT=`pwd`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR


CONTAINER_NAME="kibana"

if [ ! -e $(docker ps -aq -f "name=$CONTAINER_NAME") ]
then
    docker stop $CONTAINER_NAME
    docker rm -vf $CONTAINER_NAME
fi

docker run -d --name $CONTAINER_NAME \
       --net=my_network \
       --dns 192.168.100.24 \
       -p 5601:5601 \
       kibana:5

cd $CURRENT
