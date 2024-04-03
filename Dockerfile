FROM debian:12.5-slim as builder

RUN apt-get update && apt-get install -f -y \
    build-essential \
    libssl-dev \
    git \
    zlib1g-dev \
    gnutls-bin \
    && git clone https://github.com/giltene/wrk2.git \
    && cd wrk2 \
    && make \
    && cp wrk /usr/local/bin/wrk2

FROM debian:12.5-slim

COPY --from=builder /usr/local/bin/wrk2 /usr/local/bin/wrk2

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
