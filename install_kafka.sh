yum update -y
yum install java-1.8.0-openjdk -y

mkdir /opt/kafka
cd /opt/kafka
wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz --no-check-certificate
tar -zxvf kafka_2.13-3.1.0.tgz

TARGET_DIRS="/opt/kafka/kafka_2.13-3.1.0"
cd ${TARGET_DIRS}/config
server_ip=`ifconfig eth0 | grep 'inet' | cut -d: -f2 | awk '{ print $2}'`
zookeeper_ip=${server_ip}:2181
sed -i -e 's,zookeeper.connect=localhost:2181,#zookeeper.connect=localhost:2181,g' ./server.properties
echo -e "zookeeper.connect=${zookeeper_ip}" >> ./server.properties
echo -e "server.1=${server_ip}:2888:3888" >> ./zookeeper.properties

nohup ${TARGET_DIRS}/bin/zookeeper-server-start.sh ${TARGET_DIRS}/config/zookeeper.properties 1>/dev/null 2>&1 &
nohup ${TARGET_DIRS}/bin/kafka-server-start.sh ${TARGET_DIRS}/config/server.properties 1>/dev/null 2>&1 &

