# vector-logging
### Роли
* **build_images**

Собирает кастомные образы vector и kafka. Все необходимые файлы лежат в build_images/files/${service_name}. 

*TODO: делать билд на отдельном агенте и пушить в registry*

* **create_network**

Создает сеть logging на машине

* **install_docker**

Устанавливает докер на хосте

* **elastic**

Запускает контейнер с elasticsearch в режиме single-node. 

*TODO: поднимать распределенный кластер.*

* **grafana**

Запускает контейнер с grafana с уже подготовленным data_source - elasticsearch (datasources.yml)

* **graylog**

Запускает контейнеры mongodb и graylog. Mongodb нужна грейлогу для хранения конфигов

*TODO: Graylog HA: кластер монги, кластер грейлогов (https://docs.graylog.org/v1/docs/multinode-setup)*

* **kafka**

Запускает контейнеры zookeeper и kafka. Так же создает топики в kafka, если их нет.

* **kibana**

Запускает контейнер kibana

* **logstash**

Запускает контейнер с logstash. Делался для тех сервисов, которые не умеют напрямую ходить в кафку. Забирает из топиков кафки сообщения и кладет в elasticsearch. 

*TODO: разделить outputs в зависимости от топика*

* **vector**

Запускает контейнер с вектором (https://vector.dev/). Конфиги лежат в files/; собираются логи из файлов и docker logs. env DOCKER_HOST и volume /var/run/docker.sock нужны, чтобы вектор мог цепляться к логам докера на хосте.

### Полезные команды

**kafka**

```
./kafka-topics.sh --create --zookeeper 172.17.0.2:2181 --replication-factor 1 --partitions 1 --topic ${topic_name}

./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic ${topic_name} --from-beginning

./kafka/bin/kafka-topics.sh --bootstrap-server "localhost:9092" --list |grep -w "${topic_name}"
```
