#!/usr/bin/env bash
$KAFKA_HOME/bin/kafka-console-consumer.sh --zookeeper zookeeper:2181 --topic $1 --from-beginning