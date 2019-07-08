FROM ubuntu:18.04
EXPOSE 5279 5280

VOLUME /storage
RUN apt-get update && apt-get -y install ca-certificates bash
RUN mkdir /daemon
WORKDIR /daemon
COPY lbrynet ./
COPY conf/daemon_settings.yml ./
COPY conf/test_daemon_settings.yml ./

COPY launcher.sh ./launcher.sh
RUN chmod a+x launcher.sh
CMD ["./launcher.sh"]
