#!/bin/bash -eu
V=1.21
docker build -t webfs --build-arg WEBFS_VERSION=$V .
docker login
docker tag webfs jonashaag/webfsd:$V
docker tag webfs jonashaag/webfsd:latest
docker push jonashaag/webfsd
