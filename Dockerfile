FROM ubuntu:24.04@sha256:723ad8033f109978f8c7e6421ee684efb624eb5b9251b70c6788fdb2405d050b

RUN apt-get update && apt-get install -y \
    nano \
    curl \
    iperf \
    iperf3 \
    netperf \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
