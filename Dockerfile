ARG BASE_IMAGE_TAG=jessie-slim

ARG GIT_ORIGIN
ARG GIT_DESCRIBE
ARG GIT_BRANCH
ARG GIT_UNCOMMITED

#FROM debian:jessie-20200607-slim
FROM debian:$BASE_IMAGE_TAG

ARG VOIPDP_SERVER-ARCHIVE=voipdp-server_deb_amd64.tgz
ARG VOIPDP_PACKAGE=voipdp-server+deb_amd64.deb

LABEL MAINTAINER="Mikhail Moskalev mmv.rus@gmail.com" \
      GITgit_repository="https://github.com/mmv-ru/voipdp-server-docker.git" \
      GIT_DESCRIBE="$GIT_DESCRIBE" \
      GIT_BRANCH="$GIT_BRANCH" \
      GIT_UNCOMMITED="$GIT_UNCOMMITED" \
      GIT_ORIGIN="$GIT_ORIGIN"

COPY $VOIPDP_PACKAGE /package/voipdp-server_amd64.deb
RUN apt-get update && dpkg -i /package/voipdp-server_amd64.deb || apt-get -fy install

EXPOSE 8888/tcp
EXPOSE 5757/udp
EXPOSE 50000-51000/udp
EXPOSE 5061/udp
EXPOSE 40000-41000/udp

VOLUME ["/usr/local/voipdp-server/conf", "/usr/local/voipdp-server/log"]

ENTRYPOINT ["/usr/local/voipdp-server/bin/voipdp-server"]
