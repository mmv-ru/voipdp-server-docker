#!/bin/bash
export VERSION=3.5.25-26
export PLATFORM=deb_amd64
pushd "$(dirname "$0")"
curl -o voipdp-server_deb_amd64.tgz \
     http://download.komendant.pro/voip-dp/linux/voipdp-server_$PLATFORM.tgz
if ! sha1sum -c voipdp-server_$(VERSION)_$(PLATFORM).sha1; then
    echo downloaded package SHA1 not match version $(VERSION)_$(PLATFORM)
    exit 1
fi
tar --extract -f voipdp-server_deb_amd64.tgz voipdp-server+$PLATFORM.deb
docker build -t mmvrus/voipdp-server:$(VERSION)-debian8 .
popd
