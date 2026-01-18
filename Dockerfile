FROM debian:13.3-slim

RUN sed -i -e 's/main/main non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources \
    && apt update \
    && apt install -y \
    nano \
    vim \
    wrk \
    curl \
    iperf \
    iperf3 \
    netperf \
    net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
