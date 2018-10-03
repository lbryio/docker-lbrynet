FROM ubuntu:18.04
EXPOSE 5279
VOLUME /storage
RUN apt-get update && apt-get -y install unzip ca-certificates
RUN mkdir /daemon
ADD https://github.com/lbryio/lbry/releases/download/v0.30.0rc2/lbrynet-linux.zip /daemon/lbrynet-linux.zip
WORKDIR /daemon
RUN unzip lbrynet-linux.zip
RUN rm lbrynet-linux.zip
ENV LBRY_DATA_DIR /storage/data
ENV LBRY_LBRYUM_WALLET_DIR /storage/lbryum
ENV LBRY_DOWNLOAD_DIRECTORY /storage/download
ENV LBRY_API_HOST 0.0.0.0
COPY start.sh ./start.sh
CMD ["./start.sh"]
