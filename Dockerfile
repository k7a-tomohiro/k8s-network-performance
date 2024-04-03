FROM debian:12.5-slim

RUN sed -i -e 's/main/main non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources \
    && apt-get update && apt-get install -y \
    nano \
    wrk \
    curl \
    iperf \
    iperf3 \
    netperf \
    net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
