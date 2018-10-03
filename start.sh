#!/bin/sh

if [ ! -d "$LBRY_LBRYUM_WALLET_DIR" ]; then
    mkdir $LBRY_LBRYUM_WALLET_DIR
fi

./lbrynet start
