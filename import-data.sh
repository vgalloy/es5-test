#!/bin/bash

CURRENT=`pwd`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

docker run -it --rm \
       --net=my_network \
       -v "$PWD":/config-dir \
       -v "$PWD"/data:/data \
       logstash:5 -f /config-dir/logstash.conf

cd $CURRENT
