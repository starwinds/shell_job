. env_conf

apt-get update
apt-get -y install git curl wget vim unzip build-essential
apt-get install -y openjdk-6-jdk
apt-get install -y maven


cd /usr/src/ && git clone $source_banach_git_url

cd /usr/src/banach/auth-gate/ && mvn clean install -DskipTests=true


cd /usr/src/ && git clone $source_consumer_git_url

cd /usr/src/consumer/ && ./install.sh

cd /opt/ && cp /usr/src/consumer/target/crams-consumer.tar.gz ./ && tar zxvf crams-consumer.tar.gz && mv crams-consumer watch_consumer

mkdir -p /opt/watch_consumer/logs

sed -r -i "s/test=/#test=/g" /opt/watch_consumer/conf/cramsConsumerPlugins.properties

sed -r -i "s/UcloudWatchPlugin=/#UcloudWatchPlugin=/g" /opt/watch_consumer/conf/cramsConsumerPlugins.properties 

echo -e "$kafka_topic=$consumer_plugin\n$consumer_plugin=$target_server_url\n" >> /opt/watch_consumer/conf/cramsConsumerPlugins.properties

sed -r -i "s/groupId=/#groupId=/g" /opt/watch_consumer/conf/kafkaConsumer.properties

echo -e "groupId=$consumer_group_id\n" >> /opt/watch_consumer/conf/kafkaConsumer.properties

sed -r -i "s/zookeeper=/#zookeeper=/g" /opt/watch_consumer/conf/kafkaConsumer.properties

sed -r -i "s/topic=/#topic=/g" /opt/watch_consumer/conf/kafkaConsumer.properties

echo -e "zookeeper=$zookeeper_ip\ntopic=$kafka_topic\nnumberOfThread=1" >> /opt/watch_consumer/conf/kafkaConsumer.properties

sed -r -i "s/JAVA_HOME=/#JAVA_HOME=/g" /opt/watch_consumer/bin/crams-consumer.sh

sed -i "5i\JAVA_HOME=$JAVA_HOME" /opt/watch_consumer/bin/crams-consumer.sh

ENV CONSUMER_HOME /opt/watch_consumer/
echo "CONSUMER_HOME=$CONSUMER_HOME/" >> /etc/bash.bashrc
source /etc/bash.bashrc

apt-get install -y cron
apt-get install -y jsvc

cd /usr/src/consumer/ && git fetch && git pull origin master && echo "git fetched"

/opt/watch_consumer/bin/crams-consumer.sh start && sleep 10 && tail -f /opt/watch_consumer/error-jsvc.log
