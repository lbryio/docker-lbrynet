#!/bin/bash

URL=$(
    curl -si https://api.github.com/repos/lbryio/lbry/releases/latest|
    grep browser_download_url|
    sed -E 's/.*"([^"]+)".*/\1/'|
    grep linux
)

echo "Getting the latest release from $URL..."
curl -OL $URL
unzip lbrynet-linux.zip
rm lbrynet-linux.zip
