#!/bin/bash
waitonport.sh kafka 9092
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 8 --topic pocsp-inbound
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 8 --topic pocsp-header-defaulted
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 8 --topic pocsp-decoded
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 8 --topic pocsp-defaulted
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 8 --topic pocsp-valid-payload
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic pocsp-invalid-payload
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic pocsp-unknown-campaign
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 8 --topic pocsp-protobuf-transformed
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 8 --topic pocsp-protobuf-encoded
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 8 --topic pocsp-payload-extracted