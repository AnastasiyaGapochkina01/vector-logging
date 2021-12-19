#!/bin/bash -ex
export KAFKA_ZK_CONNECT
export KAFKA_ADV_LIST

# configure
sed -i 's/zookeeper.connect=localhost:2181/zookeeper.connect='$KAFKA_ZK_CONNECT'/g' /opt/kafka/config/server.properties
sed -i '/advertised.listeners/s/^#//g' /opt/kafka/config/server.properties
sed -i 's/your.host.name:9092/'$KAFKA_ADV_LIST'/g' /opt/kafka/config/server.properties

# run kafka-server
exec /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties