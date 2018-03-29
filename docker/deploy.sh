#!/bin/bash
tag="natefoo/manylinux1_$PLATFORM"
docker login -u $QUAY_USERNAME -p "$QUAY_PASSWORD" quay.io
docker tag ${tag}:${TRAVIS_COMMIT} quay.io/${tag}:${TRAVIS_COMMIT}
docker tag ${tag}:${TRAVIS_COMMIT} quay.io/${tag}:latest
docker tag ${tag}:${TRAVIS_COMMIT} ${tag}:latest
docker push quay.io/${tag}:latest
docker login -u $HUB_USERNAME -p "$HUB_PASSWORD"
docker push ${tag}:latest
