#FROM debian:jessie-20200607-slim
FROM debian:jessie-slim
ARG VOIPDP_SERVER-ARCHIVE=voipdp-server_deb_amd64.tgz
ARG VOIPDP_PACKAGE=voipdp-server+deb_amd64.deb
COPY $VOIPDP_PACKAGE /package/voipdp-server_amd64.deb
RUN apt-get update && dpkg -i /package/voipdp-server_amd64.deb || apt-get -fy install

