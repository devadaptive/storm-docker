FROM devadaptive/storm:1.0.1
MAINTAINER devadaptive

ENV IS_NIMBUS_SERVER true

RUN /usr/bin/config-supervisord.sh nimbus 
RUN /usr/bin/config-supervisord.sh drpc

EXPOSE 6627
EXPOSE 3772
EXPOSE 3773

CMD /usr/bin/start-supervisor.sh
