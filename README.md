# voipdp-server docker image
Служба SIP Gateway/PBX для домофонов VoIP-DP1 VoIP-DP2
http://komendant.pro/index.php/ru/sip_voip_pbx_doorphone/

Упаковал в контейнер поскольку сервис нe работает на CentOS8

Предполагается что конфигурация изменена относительно конфигурации по умолчанию.
[sip]
port-range-start=40000
port-range-stop=41000

## Usege

```
docker container rm voipdp-server
docker run --net=host --name=voipdp-server \
  --detach \
  -v /etc/voipdp-server:/usr/local/voipdp-server/conf:z \
  -v /var/log/voipdp-server:/usr/local/voipdp-server/log:z \
  --restart unless-stopped \
  mmvrus/voipdp-server:3.5.25-26-debian8
```

## choosing base image
on debian:jessie-slim - voipdp-server + dependencies take  98.85 Mb
on debian:jessie      - voipdp-server + dependencies take 129.11 Mb
