#!/bin/bash
STORM_SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo  '########################################'
echo  '## building storm base                ##'
echo  '########################################'
docker build --no-cache -t="devadaptive/storm:0.10.0" ${STORM_SCRIPT_DIR}/storm
#docker tag devadaptive/storm:0.10.0 devadaptive/storm:latest

echo  '########################################'
echo  '## building storm-nimbus              ##'
echo  '########################################'
docker build --no-cache -t="devadaptive/storm-nimbus:0.10.0" ${STORM_SCRIPT_DIR}/storm-nimbus
#docker tag devadaptive/storm-nimbus:0.10.0 devadaptive/storm-nimbus:latest

echo  '########################################'
echo  '## building storm-supervisor          ##'
echo  '########################################'
docker build -t="devadaptive/storm-supervisor:0.10.0" ${STORM_SCRIPT_DIR}/storm-supervisor
#docker tag devadaptive/storm-supervisor:0.10.0 devadaptive/storm-supervisor:latest

echo  '########################################'
echo  '## building storm-ui                  ##'
echo  '########################################'
docker build --no-cache -t="devadaptive/storm-ui:0.10.0" ${STORM_SCRIPT_DIR}/storm-ui
#docker tag devadaptive/storm-ui:0.10.0 devadaptive/storm-ui:latest
