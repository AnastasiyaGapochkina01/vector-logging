FROM openjdk:11.0.13-slim-buster

ARG KAFKA_VERSION=2.7.2
ARG SCALA_VERSION=2.13
ARG KAFKA_PORT=9092

RUN apt-get update && apt-get install -y curl wget bash procps software-properties-common netcat net-tools

WORKDIR /tmp

RUN wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && tar -xvzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt/ && mv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka

WORKDIR /opt
COPY start.sh /opt
COPY create_topic.sh /opt

CMD [ "/opt/start.sh" ]
#HEALTHCHECK CMD nc -zv localhost ${KAFKA_PORT} || exit 1