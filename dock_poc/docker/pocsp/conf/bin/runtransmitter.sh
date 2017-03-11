#!/bin/bash
java -jar /usr/local/transmitter/pocsp.outboundtransmitter.jar kafka:9092 pocsp-protobuf-encoded http://outbound:8080/sdip/1/sensorData