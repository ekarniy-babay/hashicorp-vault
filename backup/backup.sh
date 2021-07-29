#!/bin/bash
# This script allows you to backup a single volume from a container
# Data in given volume is saved in the current directory in a tar archive.
# https://stackoverflow.com/questions/26331651/how-can-i-backup-a-docker-container-with-its-data-volumes#:~:text=To%20backup%20a%20data%20volume,data%20for%20a%20MySQL%20server.
CONTAINER_NAME=$1
VOLUME_NAME=$2

usage() {
  echo "Usage: $0 [container name] [volume name]"
  exit 1
}

if [ -z $CONTAINER_NAME ]
then
  echo "Error: missing container name parameter."
  usage
fi

if [ -z $VOLUME_NAME ]
then
  echo "Error: missing volume name parameter."
  usage
fi
date=$(date '+%Y-%m-%d')
sudo docker run --rm --volumes-from $CONTAINER_NAME -v $(pwd):/backup busybox tar cvf /backup/backup-$CONTAINER_NAME-$date.tar $VOLUME_NAME
