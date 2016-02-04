#!/usr/bin/env bash

: ${ZOOKEEPER_HOST:=zk}
: ${NIMBUS_HOST:=nimbus}


IP=`hostname -i | awk '{print $1}'`

if [ ! -f $STORM_HOME/conf/storm.yaml ]; then
    mv $STORM_HOME/conf/storm-template.yaml $STORM_HOME/conf/storm.yaml
    # IS_NIMBUS_SERVER is set in the Dockerfile
    if [ "$IS_NIMBUS_SERVER" = true ] ; then
        sed -i -e "s/%nimbus%/${IP}/g" $STORM_HOME/conf/storm.yaml
    else
        sed -i -e "s/%nimbus%/${NIMBUS_HOST}/g" $STORM_HOME/conf/storm.yaml
    fi
    sed -i -e "s/%zookeeper%/${ZOOKEEPER_HOST}/g" $STORM_HOME/conf/storm.yaml
    echo "storm.local.hostname: \"${IP}\"" >> $STORM_HOME/conf/storm.yaml
fi

echo "************ using config ************"
cat $STORM_HOME/conf/storm.yaml
echo "**************************************"

/usr/sbin/sshd && supervisord
