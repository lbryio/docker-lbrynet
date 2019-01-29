#!/bin/sh

if [ ! -d "$LBRY_LBRYUM_WALLET_DIR" ]; then
    mkdir $LBRY_LBRYUM_WALLET_DIR
fi
if [ ! -d "$LBRY_DOWNLOAD_DIRECTORY" ]; then
    mkdir $LBRY_DOWNLOAD_DIRECTORY
fi

if [ -z ${LBRY_DOCKER_CONFIG+x} ]; then
    ./lbrynet start --config=/daemon/daemon_settings.yml
else
    ./lbrynet start --config=$LBRY_DOCKER_CONFIG
fi
