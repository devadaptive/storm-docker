#!/bin/bash

echo  '########################################'
echo  '## building storm base                ##'
echo  '########################################'
docker build -t="devadaptive/storm:0.10.0" storm
#docker tag devadaptive/storm:0.10.0 devadaptive/storm:latest

echo  '########################################'
echo  '## building storm-nimbus              ##'
echo  '########################################'
docker build -t="devadaptive/storm-nimbus:0.10.0" storm-nimbus
#docker tag devadaptive/storm-nimbus:0.10.0 devadaptive/storm-nimbus:latest

echo  '########################################'
echo  '## building storm-supervisor          ##'
echo  '########################################'
docker build -t="devadaptive/storm-supervisor:0.10.0" storm-supervisor
#docker tag devadaptive/storm-supervisor:0.10.0 devadaptive/storm-supervisor:latest

echo  '########################################'
echo  '## building storm-ui                  ##'
echo  '########################################'
docker build -t="devadaptive/storm-ui:0.10.0" storm-ui
#docker tag devadaptive/storm-ui:0.10.0 devadaptive/storm-ui:latest
