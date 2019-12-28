#!/bin/sh

if ! [ -n "$1" ] ; then
    echo "Please provide directory for blockchain data."
    exit 1
fi

docker stop sumcoin
docker rm sumcoin

chown -R dockeruser "$1"

docker run --restart=always -d --name sumcoin \
    --cap-drop all \
    -p 8532:8532 \
    -v "$1":/opt/graphsense/data \
    -it sumcoin
docker ps -a
