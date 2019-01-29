# Dockerfile for building lbrynet image

## Image usage

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

## Building

```
docker build -t sayplastic/lbrynet:0.30rc6 .
docker tag sayplastic/lbrynet:0.30rc6 sayplastic/lbrynet:latest
docker push sayplastic/lbrynet
```
