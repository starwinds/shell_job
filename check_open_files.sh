echo "print cdp consumer process's open files"
for pid in `ps -ef | grep cdp-con | grep -v grep | awk '{print $2}'`
do
 echo "pid: "$pid
openfiles=`lsof -p $pid | wc -l`
echo "openfiles: "$openfiles
done
