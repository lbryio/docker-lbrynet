#!/bin/bash

set -o xtrace
set -e

SDK_ARGS=""

function parse_yaml {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

if [ -z ${SDK_CONFIG+x} ]; then
    CONFIG="/daemon/daemon_settings.yml"
else
    CONFIG=$SDK_CONFIG
fi

cat $CONFIG

eval $(parse_yaml ${CONFIG} "LBRY_")

if [ ! -d "$LBRY_data_dir" ]; then
    mkdir $LBRY_data_dir
fi
if [ ! -d "$LBRY_wallet_dir" ]; then
    mkdir $LBRY_wallet_dir
fi
if [ ! -d "$LBRY_download_dir" ]; then
    mkdir $LBRY_download_dir
fi

if [ ! -z ${SDK_LBRYUM_SERVERS+x} ]; then
    SDK_ARGS="${SDK_ARGS} --lbryum-servers=${SDK_LBRYUM_SERVERS}"
fi

./lbrynet start --config=$CONFIG $SDK_ARGS
