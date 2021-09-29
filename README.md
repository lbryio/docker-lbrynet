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

You need to have the docker toolset installed on your system, as well as the ability to execute Makefiles and bash scripts.

#### Using the provided Makefile

This is the preferred method because it also checks if our newly built container can actually run.

```
export VERSION=0.101.1
make image
make publish
```

#### Manually

```
make image
docker build -t lbry/lbrynet-tv:0.101.1
docker push lbry/lbrynet-tv:0.101.1
```
