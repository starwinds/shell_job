destip=$1
user=$2
passwd=$3

cd /root/;ssh-keygen -t rsa
sshpass -p $passwd ssh $user@$destip mkdir -p .ssh
cd /root/.ssh/;cat id_rsa.pub | sshpass -p $passwd ssh $user@$destip 'cat >> .ssh/authorized_keys'
