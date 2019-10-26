# Dockerfile for building lbrynet image

## Image usage

Put this in your docker-compose file:

```
version: '3.2'

services:
  daemon_test_local:
    image: lbry/lbrynet-tv:latest
    ports:
      - "5279:5279"
    volumes:
      - type: bind
        source: ./storage
        target: /storage
    # or
    volumes:
      - type: volume
        source: storage
        target: /storage
```

## Updating, building and publishing

You need to have docker toolset installed on your system, as well as the ability to execute Makefiles and bash scripts.

#### Using the provided Makefile

This is the preferred method because it also checks if our newly built container can actually run.

```
make latest_image
# or
make latest_rc_image
make publish VERSION=0.36.0
```

#### Manually

```
make get_release
docker build -t lbry/lbrynet-tv:0.36.0 .
docker tag lbry/lbrynet-tv:0.36.0 lbry/lbrynet-tv:latest
docker push lbry/lbrynet-tv
```
