api_key=$1
secret_key=$2

cd /opt/;wget https://raw.githubusercontent.com/starwinds/watchagent/master/ucloud_watch_agent-1.0.0-1.x86_64.rpm 
rpm -ivh ucloud_watch_agent-1.0.0-1.x86_64.rpm
cd /watch/agent/scripts/
/bin/bash postinst.sh $api_key $secret_key
service wagent start
