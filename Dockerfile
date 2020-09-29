FROM openjdk:8-jre
LABEL maintainer='theosun@outlook.com'

ENV ACTIVEMQ_VERSION=2.15.0

WORKDIR /app

RUN wget "https://apache.website-solution.net/activemq/activemq-artemis/${ACTIVEMQ_VERSION}/apache-artemis-${ACTIVEMQ_VERSION}-bin.tar.gz"

RUN tar -zxvf "apache-artemis-${ACTIVEMQ_VERSION}-bin.tar.gz"

RUN rm "apache-artemis-${ACTIVEMQ_VERSION}-bin.tar.gz"

WORKDIR "/app/${ACTIVEMQ_VERSION}"

RUN "/app/${ACTIVEMQ_VERSION}/artemis create /instance/main --user admin --password nimda --require-login Y"

# Expose all port
EXPOSE 8161
EXPOSE 61616
EXPOSE 5672
EXPOSE 61613
EXPOSE 1883
EXPOSE 61614

CMD [ "instance/main/bin/artemis", "run" ]