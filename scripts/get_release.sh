#!/bin/bash

if [[ ${1} == "rc" ]]; then
    API_URL="https://api.github.com/repos/lbryio/lbry/releases"
else
    API_URL="https://api.github.com/repos/lbryio/lbry/releases/latest"
fi

URL=$(
    curl -si ${API_URL}|
    grep browser_download_url|
    grep linux|
    head -n 1|
    sed -E 's/.*"([^"]+)".*/\1/'
)

VERSION=$(echo $URL|sed -e 's/.*download\/v\([^"]*\)\/.*/\1/')

echo "Getting the latest version ${VERSION} from ${URL}..."
curl -OL $URL
unzip lbrynet-linux.zip
rm lbrynet-linux.zip

docker build -t lbryweb/lbrynet:$VERSION -t lbryweb/lbrynet:latest .
