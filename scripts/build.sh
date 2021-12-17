#!/bin/bash

set -e

BASE_IMAGE_NAME=lbry/lbrynet-tv
WAIT=5

if [ -z ${1} ]; then
    echo "Please provide lbrynet version as an argument."
    exit 1
fi

VERSION=$1
RELEASE_URL="https://github.com/lbryio/lbry-sdk/releases/download/v$VERSION/lbrynet-linux.zip"

echo "Getting the version ${VERSION} from ${RELEASE_URL}..."
curl -OL $RELEASE_URL
unzip lbrynet-linux.zip
rm lbrynet-linux.zip

docker build -t ${BASE_IMAGE_NAME}:${VERSION} --platform linux/amd64 .

echo "Launching container for ${BASE_IMAGE_NAME}:${VERSION} and giving it ${WAIT}s to launch..."

ID=$(docker run --detach --rm $BASE_IMAGE_NAME:$VERSION)
sleep $WAIT

if [[ -z "${ID+x}" || ! $(docker top "$ID") ]]; then
    echo "Container crashed unexpectedly, aborting"
    exit 1
fi

echo "Container launched successfully, stopping it"
docker kill $ID
