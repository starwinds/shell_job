pwd=
ip=
for i in {1..16}
do
 index=$i
 sshpass -p $pwd ssh -n -o ConnectTimeout=2 -o StrictHostKeyChecking=no root@$ip.$index "cd /var/log/;mkdir -p cdp_agent_backup;mv /var/log/cdp_agent/VmPerfRRDAgent.py /var/log/cdp_agent_backup/"
 sshpass -p $pwd scp -o ConnectTimeout=2 /usr/src/conntrack_watch_agent/VmPerfRRDAgent.py root@$ip.$index:/var/log/cdp_agent/
 sshpass -p $pwd ssh -n -o ConnectTimeout=2 -o StrictHostKeyChecking=no root@$ip.$index "hostname;date"
done
