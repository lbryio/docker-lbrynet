#!/bin/sh

curl -sd '{"method": "status"}' $1 |grep '"wallet": true'
