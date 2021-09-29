#!/bin/bash

set -e

BASE_IMAGE_NAME=lbry/lbrynet-tv

if [ -z ${1} ]; then
    echo "Please provide ${BASE_IMAGE_NAME} version as an argument."
    exit 1
fi

VERSION=$1
echo "Pushing to Docker Hub..."
docker push ${BASE_IMAGE_NAME}:${VERSION}
