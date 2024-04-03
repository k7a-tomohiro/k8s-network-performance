<div align="center">

![logo](./logo.svg)

# k8s network performance test container

</div>

This project provides a container for network performance tests.

The container is available at [DockerHub](https://hub.docker.com/r/tomopiro/netperf).

## What's in the contaienr

- [**wrk**](https://github.com/wg/wrk)
- [**iperf2**](https://sourceforge.net/projects/iperf2/)
- [**iperf3**](https://github.com/esnet/iperf)
- [**netperf**](https://github.com/HewlettPackard/netperf)

Note that the iperf2 and iperf3 are not compatible.
See the [Iperf 2 & Iperf 3 Comparison Table](https://iperf2.sourceforge.io/IperfCompare.html).

## Container structure

- [Debian](https://hub.docker.com/_/debian) is used for the base image.
- No `Entrypoint` defined.
- CMD is `/bin/bash`.
- Installed tools are
  - nano
  - wrk
  - curl
  - netperf
  - iperf2
  - iperf3
  - net-tools

## Environmental variables

No environmental variables are defined for the container.

## Run the container

### iperf2

Official documentation can be found at [iperf.fr](https://iperf.fr/iperf-doc.php#doc).

`iperf` command is installed in the PATH.

1. Run a server.

```bash
# Create a network to access from client.
docker create network netperf

# Run iperf2 server
docker run -it --network netperf --hostname netperf tomopiro/netperf iperf -s
```

2. Run client and check performance.

```bash
# Run iperf2 client in the same network as the server.
docker run -it --network netperf tomopiro/netperf iperf -c netperf
```

### iperf3

Official documentation can be found at [iperf.fr](https://iperf.fr/iperf-doc.php#3doc).

`iperf3` command is installed in the PATH.

1. Run a server.

```bash
# Create a network to access from client.
docker create network netperf

# Run iperf3 server
docker run -it --network netperf --hostname netperf tomopiro/netperf iperf3 -s
```

2. Run client and check performance.

```bash
# Run iperf3 client in the same network as the server.
docker run -it --network netperf tomopiro/netperf iperf3 -c netperf
```

### netperf

Official documentation can be found at [Care and Feeding of Netperf 2.7.X](https://hewlettpackard.github.io/netperf/doc/netperf.html).

`netperf` command is installed in the PATH.

1. Run a server.

```bash
# Create a network to access from client.
docker create network netperf

# Run netperf server.
docker run -it --network netperf --hostname netperf tomopiro/netperf netserver -D -L 0.0.0.0
```

2. Run client and check performance.

```bash
# Run netperf client in the same network as the server.
docker run -it --network netperf tomopiro/netperf netperf -H netperf
```
