#!/bin/sh

if [ ! -d "$LBRY_LBRYUM_WALLET_DIR" ]; then
    mkdir $LBRY_LBRYUM_WALLET_DIR
fi
if [ ! -d "$LBRY_DOWNLOAD_DIRECTORY" ]; then
    mkdir $LBRY_DOWNLOAD_DIRECTORY
fi

./lbrynet start
