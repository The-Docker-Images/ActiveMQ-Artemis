![](https://activemq.apache.org/assets/img/activemq_logo_black_small.png) 

# Docker Image of ActiveMQ Artemis

## Run

> The DEFAULT USER is `admin/nimda`

```bash
docker run -d --restart=always -p 8161:8161 -p 5672:5672 thedockerimages/activemq:latest
```


## Ports

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

```dockerfile
VOLUME [ "/instance/main/data" ]
```