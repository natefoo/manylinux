#!/bin/bash
docker login -u $QUAY_USERNAME -p $QUAY_PASSWORD quay.io
tag="quay.io/natefoo/manylinux1_$PLATFORM"
docker tag ${tag}:${TRAVIS_COMMIT} ${tag}:latest
docker push ${tag}:latest
docker login -u $HUB_USERNAME -p $HUB_PASSWORD hub.docker.com
tag="natefoo/manylinux1_$PLATFORM"
docker push ${tag}:latest
