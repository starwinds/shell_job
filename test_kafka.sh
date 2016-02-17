. /usr/src/env_conf

test_type=$1
consumer_group=$2
if [ -z $consumer_group ]
then
 consumer_group=test_group
fi

if [ $test_type = "describe" ]
then
 $KAFKA_HOME/bin/kafka-topics.sh --describe --zookeeper $zookeeper_ip --topic $kafka_topic
elif [ $test_type = "producer" ] 
then
 $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list $broker_list --topic $kafka_topic
elif [ $test_type = "consumer" ]
then
 $KAFKA_HOME/bin/kafka-console-consumer.sh --zookeeper $zookeeper_ip --topic $kafka_topic --group $consumer_group
fi
