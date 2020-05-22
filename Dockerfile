FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y python3-pip libusb-1.0-0-dev libudev-dev && \
    python3 -m pip install liquidctl

COPY run.sh /usr/local/bin

RUN chmod +x /usr/local/bin/run.sh 

ENTRYPOINT /usr/local/bin/run.sh
