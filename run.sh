docker container rm voipdp-server
docker run --net=host --name=voipdp-server \
  --detach \
  -v /etc/voipdp-server:/usr/local/voipdp-server/conf:z \
  -v /var/log/voipdp-server:/usr/local/voipdp-server/log:z \
  --restart unless-stopped \
  voipdp-server:3.5.25-26-debian8
