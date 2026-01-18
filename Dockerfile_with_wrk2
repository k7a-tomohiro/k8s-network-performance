FROM debian:13.3-slim AS wrk2

RUN apt update \
    && apt install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    git

RUN git clone https://github.com/giltene/wrk2.git \
    && cd wrk2 \
    && make

FROM debian:13.3-slim

COPY --from=wrk2 /wrk2/wrk /usr/local/bin/wrk2

RUN sed -i -e 's/main/main non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources \
    && apt update \
    && apt install -y \
    vim \
    wrk \
    curl \
    iperf \
    iperf3 \
    netperf \
    net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
