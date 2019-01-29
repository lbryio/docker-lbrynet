FROM ubuntu:18.04
EXPOSE 5279
VOLUME /storage
RUN apt-get update && apt-get -y install unzip ca-certificates
RUN mkdir /daemon
WORKDIR /daemon
COPY lbrynet ./
COPY conf/daemon_settings.yml ./
COPY conf/test_daemon_settings.yml ./
ENV LBRY_DATA_DIR /storage/data
ENV LBRY_LBRYUM_WALLET_DIR /storage/lbryum
ENV LBRY_DOWNLOAD_DIRECTORY /storage/download
ENV LBRY_API_HOST 0.0.0.0
COPY start.sh ./start.sh
RUN chmod a+x start.sh
CMD ["./start.sh"]
