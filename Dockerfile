FROM ubuntu:latest
EXPOSE 5279 5280

VOLUME /storage
RUN apt-get update && apt-get -y install ca-certificates bash
RUN mkdir /daemon
WORKDIR /daemon
COPY lbrynet ./
COPY conf/daemon_settings.yml ./
COPY conf/test_daemon_settings.yml ./
COPY conf/regtest_daemon_settings.yml ./

COPY launcher.sh ./launcher.sh
COPY scripts/probe.sh ./probe.sh
RUN chmod +x lbrynet ./*.sh
CMD ["./launcher.sh"]
