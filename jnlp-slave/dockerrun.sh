#!/bin/bash

# change URL
export NODEID=$1
export URL=$2
export PORT=$3

SLAVEDIR=~/ci/slaves/$NODEID
SLAVESSHPORT=$PORT

mkdir -p $SLAVEDIR

docker run \
    --name "ci-jnlp-slave" \
    -p $SLAVESSHPORT:22 \
    -v $SLAVEDIR:/var/lib/jenkins \
    -e URL=$URL \
    -d \
    ci/jnlp-slave


