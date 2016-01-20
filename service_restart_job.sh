cd /home/cdp/cdp-consumer-1.0.0/
bin/crams-consumer.sh stop;
sleep 5;
ps -ef | grep cdp-con | grep -v grep
pcount=`ps -ef | grep cdp-con | grep -v grep | wc -l`
if [ 0 -ne $pcount ]
then
 for pid in `ps -ef | grep cdp-con | grep -v grep | awk '{print $2}'`
do
  echo "pid: "$pid;
  `kill -9 $pid`;
done
fi
ps -ef | grep cdp-con | grep -v grep
bin/crams-consumer.sh start;
