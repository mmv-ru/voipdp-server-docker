#!/usr/bin/sh
pushd "$(dirname "$0")"
wget http://download.komendant.pro/voip-dp/linux/voipdp-server_deb_amd64.tgz
tar --extract -f voipdp-server_deb_amd64.tgz voipdp-server+deb_amd64.deb
docker build -t voipdp-server:3.5.25-26-debian8 .
popd
