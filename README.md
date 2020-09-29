![](https://activemq.apache.org/assets/img/activemq_logo_black_small.png) 

# Docker Image of ActiveMQ Artemis

[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/thedockerimages/activemq)
](https://hub.docker.com/repository/docker/thedockerimages/activemq)
## Run

> The **default user** is `admin/nimda`

```bash
docker run -d --restart=always -p 8161:8161 -p 5672:5672 --name activemq1 thedockerimages/activemq:latest
```

## Ports

expose the protocol ports you need.

```dockerfile
# Web Console
EXPOSE 8161
# artemis Native
EXPOSE 61616
# AMQP
EXPOSE 5672
# STOMP
EXPOSE 61613
# MQTT
EXPOSE 1883
```

## Volumn

if you want to persist data.

```dockerfile
VOLUME [ "/instance/main/data" ]
```