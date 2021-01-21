#!/usr/bin/env bash
#START THE ZOOKEEPER SERVICE AND LOGGING
$HOME/kafka/bin/zookeeper-server-start.sh $HOME/kafka/config/zookeeper.properties  > /home/guest/zookeeper.log 2>&1 &
sleep 10

#START THE KAFKA SERVER AND LOGGING
$HOME/kafka/bin/kafka-server-start.sh $HOME/kafka/config/server.properties > /home/guest/kafka.log 2>&1 &
sleep 10

#CREATE THE TOPICS 
$HOME/kafka/bin/kafka-topics.sh --create --topic crimes --bootstrap-server localhost:9092 &
sleep 10

#LISTEN TO KAFKA EVENTS AND LOG
$HOME/kafka/bin/kafka-console-consumer.sh --topic crimes --from-beginning --bootstrap-server localhost:9092 > /home/guest/kafka_events.log 2>&1 

