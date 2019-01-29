#!/bin/bash

set +x
set -e

WAIT=5
BASE_IMAGE_NAME=sayplastic/lbrynet

if [ -z ${VERSION+x} ]; then
    echo "Please provide sayplastic/lbrynet version as \$VERSION variable."
    exit 1
fi

echo "Launching daemon container for ${BASE_IMAGE_NAME}:${VERSION} and giving it ${WAIT} secs..."

ID=$(docker run --detach --rm $BASE_IMAGE_NAME:$VERSION)
sleep $WAIT

if [[ -z "${ID+x}" || ! $(docker top "$ID") ]]; then
    echo "Container crashed unexpectedly, aborting"
    exit 1
fi

echo "Container launched successfully, stopping it"
docker kill $ID

echo "Pushing to Docker Hub..."
docker push sayplastic/lbrynet:$VERSION
