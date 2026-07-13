#!/bin/bash
set -e

sudo apt-get update

DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
    curl \
    git

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker cvatadmin

git clone --branch v2.69.0 https://github.com/cvat-ai/cvat.git /home/cvatadmin/cvat

sudo chown -R cvatadmin:cvatadmin /home/cvatadmin/cvat

cd /home/cvatadmin/cvat

touch .env

if grep -q '^CVAT_HOST=' .env; then
    sed -i "s/^CVAT_HOST=.*/CVAT_HOST=$1/" .env
else
    echo "CVAT_HOST=$1" >> .env
fi

sudo -u cvatadmin docker compose up -d