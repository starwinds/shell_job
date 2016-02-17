. env_conf

mkdir /opt/kafka
cd /opt/kafka
wget $kafka_dl_url
tar -zxvf kafka_2.8.0-0.8.1.tgz
TARGET_DIRS="/opt/kafka/kafka_2.8.0-0.8.1"
cd ${TARGET_DIRS}/config

sed -i -e 's,log.dirs=/tmp/kafka-logs,#log.dirs=/tmp/kafka-logs,g' ./server.properties
echo -e "log.dirs=${log_dir}" >> ./server.properties

# same as EPC Kafka conf 

sed -i -e 's,num.io.threads=8,#num.io.threads=8,g' ./server.properties
echo -e "num.io.threads=${num_io_threads}" >> ./server.properties

sed -i -e 's,num.partitions=2,#num.partitions=2,g' ./server.properties
echo -e "num.partitions=${num_partition}" >> ./server.properties

echo -e "log.flush.interval.messages=${log_flush_interval_messages}" >> ./server.properties

sed -i -e 's,#log.flush.interval.ms=1000,#log.flush.interval.ms=1000,g' ./server.properties
echo -e "log.flush.interval.ms=${log_flush_interval_ms}" >> ./server.properties

sed -i -e 's,log.retention.check.interval.ms=60000,#log.retention.check.interval.ms=60000,g' ./server.properties
echo -e "log.retention.check.interval.ms=${log_retention_check_interval}" >> ./server.properties

sed -i -e 's,broker.id=0,#broker.id=0,g' ./server.properties
echo -e "broker.id=${broker_id}" >> ./server.properties

sed -i -e 's,port=9092,#port=9092,g' ./server.properties
echo -e "port=${kafka_port}" >> ./server.properties

sed -i -e 's,zookeeper.connect=localhost:2181,#zookeeper.connect=localhost:2181,g' ./server.properties
echo -e "zookeeper.connect=${zookeeper_ip}" >> ./server.properties

# only for dev environment  
cd ..
#sed -i -e 's,KAFKA_HEAP_OPTS=\"-Xmx1G -Xms1G\",KAFKA_HEAP_OPTS=\"-Xmx256M -Xms128M\",g' ./bin/kafka-server-start.sh
# run kafka 

#nohup bin/zookeeper-server-start.sh config/zookeeper.properties 1>/dev/null 2>&1 &
#nohup bin/kafka-server-start.sh config/server.properties 1>/dev/null 2>&1 &


