#!/bin/bash -ex

# create topics if not exists
for i in $KAFKA_TOPIC; do
  topic_exist () {
    /opt/kafka/bin/kafka-topics.sh --bootstrap-server "localhost:$KAFKA_PORT" --list | grep -w "$i"
  #echo $?  
  }

  if topic_exist; then
    echo "Topic $i already exists"
  else
    echo -e "Creating topic $i\n"
    /opt/kafka/bin/kafka-topics.sh --bootstrap-server "localhost:$KAFKA_PORT" \
            --create \
            --partitions 1 \
            --replication-factor 1 \
	        --topic "$i"
  fi
done