#!/usr/bin/env bash
export IP=`hostname -I`
sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$IP/g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -I`" >> $STORM_HOME/conf/storm.yaml

/usr/sbin/sshd && supervisord
