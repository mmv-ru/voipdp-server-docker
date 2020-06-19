#FROM debian:jessie-20200607-slim
FROM debian:jessie-slim

ARG VOIPDP_SERVER-ARCHIVE=voipdp-server_deb_amd64.tgz
ARG VOIPDP_PACKAGE=voipdp-server+deb_amd64.deb

LABEL maintainer="Mikhail Moskalev mmv.rus@gmail.com" \
      git_repository="https://github.com/mmv-ru/voipdp-server-docker.git"

COPY $VOIPDP_PACKAGE /package/voipdp-server_amd64.deb
RUN apt-get update && dpkg -i /package/voipdp-server_amd64.deb || apt-get -fy install

EXPOSE 8888/tcp
EXPOSE 5757/udp
EXPOSE 50000-51000/udp
EXPOSE 5061/udp
EXPOSE 40000-41000/udp

VOLUME ["/usr/local/voipdp-server/conf", "/usr/local/voipdp-server/log"]

ENTRYPOINT ["/usr/local/voipdp-server/bin/voipdp-server"]
