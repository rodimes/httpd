#!/bin/bash -e
set -o pipefail

certbot certonly --standalone --agree-tos -d fastabc.com.br --keep  --email rodimes@gmail.com

exec "$@"