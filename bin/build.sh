#!/bin/bash -e
set -o pipefail

CONTAINER_NAME="httpd"

docker build -t ${CONTAINER_NAME} .
