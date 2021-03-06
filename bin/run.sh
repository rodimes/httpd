#!/bin/bash -e
set -o pipefail

. bin/build.sh

HOSTNAME=${CONTAINER_NAME}
RESTART="unless-stopped"

docker stop ${CONTAINER_NAME} || true

docker rm ${CONTAINER_NAME} || true

docker network create --driver bridge web || true

docker run -d -v /etc/letsencrypt/:/etc/letsencrypt/ -p80:80 -p443:443 --network=web --name=${CONTAINER_NAME} --hostname ${HOSTNAME} --restart ${RESTART} ${CONTAINER_NAME}
