FROM devadaptive/java:oracle-java8

MAINTAINER devadaptive

ENV DEBIAN_FRONTEND noninteractive


RUN \
    apt-get update && \
    apt-get install -y supervisor docker.io openssh-server unzip wget && \
    rm -rf /var/lib/apt/lists/* && \
    echo 'root:devadaptive' | chpasswd && \
    mkdir /var/run/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ENV STORM_HOME /opt/apache-storm-0.10.0

RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-0.10.0/apache-storm-0.10.0.tar.gz | tar -xzf - -C /opt

RUN groupadd storm && \
    useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm && \
    chown -R storm:storm $STORM_HOME && \
    mkdir /var/log/storm && \
    chown -R storm:storm /var/log/storm && \
    ln -s $STORM_HOME/bin/storm /usr/bin/storm && \
    mv $STORM_HOME/conf/storm.yaml $STORM_HOME/conf/storm.yaml.original

ADD storm-template.yaml $STORM_HOME/conf/storm-template.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
