#!/bin/bash
VERSION=3.5.25-26
PLATFORM=deb_amd64
DOCKER_HUB_LOGIN=mmvrus

pushd "$(dirname "$0")"

GIT_ORIGIN=$(git remote get-url origin)
GIT_DESCRIBE=$(git describe --tag)
GIT_BRANCH="$(git symbolic-ref HEAD 2>/dev/null)" ||
  GIT_BRANCH="(unnamed branch)"     # detached HEAD
GIT_BRANCH=${GIT_BRANCH##refs/heads/}
# Check uncommited changes
GIT_UNCOMMITED="false"
git diff-index --quiet HEAD -- || GIT_UNCOMMITED="true"


curl -o voipdp-server_deb_amd64.tgz \
     http://download.komendant.pro/voip-dp/linux/voipdp-server_$PLATFORM.tgz
if ! sha1sum -c voipdp-server_${VERSION}_${PLATFORM}.sha1; then
    echo downloaded package SHA1 not match voipdp-server version ${VERSION}_${PLATFORM}
    exit 1
fi
tar --extract -f voipdp-server_deb_amd64.tgz voipdp-server+$PLATFORM.deb
docker build -t $DOCKER_HUB_LOGIN/voipdp-server:$VERSION-debian8 \
        --build-arg "GIT_ORIGIN=$GIT_ORIGIN" \
        --build-arg "GIT_DESCRIBE=$GIT_DESCRIBE" \
        --build-arg "GIT_BRANCH=$GIT_BRANCH" \
        --build-arg "GIT_UNCOMMITED=$GIT_UNCOMMITED" \
        $@ \
        .
popd
