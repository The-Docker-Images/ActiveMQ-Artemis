FROM openjdk:8-jre
LABEL maintainer='theosun@outlook.com'

ENV ACTIVEMQ_VERSION=2.15.0

WORKDIR /app

RUN wget "https://apache.website-solution.net/activemq/activemq-artemis/${ACTIVEMQ_VERSION}/apache-artemis-${ACTIVEMQ_VERSION}-bin.tar.gz"

RUN tar -zxvf "apache-artemis-${ACTIVEMQ_VERSION}-bin.tar.gz"

RUN rm "apache-artemis-${ACTIVEMQ_VERSION}-bin.tar.gz"

WORKDIR "/app/apache-artemis-${ACTIVEMQ_VERSION}"

RUN bash -c "./bin/artemis create --user admin --password nimda --require-login /instance/main"

# allow access web console from remote
RUN sed -i 's/localhost/0.0.0.0/g' /instance/main/etc/bootstrap.xml
RUN sed -i 's/\*:\/\/localhost\*/*/g' /instance/main/etc/jolokia-access.xml 

# Expose all port
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

WORKDIR /instance/main

VOLUME [ "/instance/main/data" ]

CMD [ "/instance/main/bin/artemis", "run" ]