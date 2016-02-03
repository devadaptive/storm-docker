#!/usr/bin/env bash

: ${HOSTNAME:=`hostname`}
: ${ZOOKEEPER_HOST:=zk}


if [ ! -f $STORM_HOME/conf/storm.yaml ]; then
    mv $STORM_HOME/conf/storm-template.yaml $STORM_HOME/conf/storm.yaml
    sed -i -e "s/%zookeeper%/${ZOOKEEPER_HOST}/g" $STORM_HOME/conf/storm.yaml
    sed -i -e "s/%nimbus%/${HOSTNAME}/g" $STORM_HOME/conf/storm.yaml
    # IS_NIMBUS_SERVER is set in the Dockerfile
    if [ "$IS_NIMBUS_SERVER" = true ] ; then
        echo "storm.local.hostname: \"${HOSTNAME}\"" >> $STORM_HOME/conf/storm.yaml
    fi
fi

echo "********** using config **********"
cat $STORM_HOME/conf/storm.yaml
echo "**********************************"

/usr/sbin/sshd && supervisord
