# Dockerfile for building lbrynet image

## Image usage

Put this in your docker-compose file:

```
version: '3.2'

services:
  daemon_test_local:
    image: sayplastic/lbrynet:latest
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

#### Using the provided Makefile

This is the preferred method because it also checks if our newly built container can actually run.

```
make get_release
VERSION=0.30.5 make build
VERSION=0.30.5 make publish
```

#### Manually

```
make get_release
docker build -t sayplastic/lbrynet:0.30rc6 .
docker tag sayplastic/lbrynet:0.30rc6 sayplastic/lbrynet:latest
docker push sayplastic/lbrynet
```
