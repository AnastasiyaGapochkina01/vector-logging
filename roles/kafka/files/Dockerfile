FROM openjdk:11.0.13-slim-buster

ARG KAFKA_VERSION=2.7.2
ARG SCALA_VERSION=2.13

RUN apt-get update && apt-get install -y curl wget bash procps software-properties-common

WORKDIR /tmp

RUN wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && tar -xvzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt/

WORKDIR /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin
#docker inspect zookeeper --format='{{ .NetworkSettings.IPAddress }}' 
# КОСТЫЛЬ! переделать под net = host или что-то такое
RUN sed -i 's/zookeeper.connect=localhost:2181/zookeeper.connect=172.17.0.2:2181/g' ../config/server.properties 

#CMD ["/opt/kafka/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin/kafka-server-start.sh"]
CMD ["./kafka-server-start.sh", "../config/server.properties"]