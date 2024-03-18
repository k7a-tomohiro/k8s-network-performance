# k8s-network-performance

This project provides some containers for network performance tests.

Supported tools are

- [**iperf2**](https://sourceforge.net/projects/iperf2/)
- [**iperf3**](https://github.com/esnet/iperf)
- [**netperf**](https://github.com/HewlettPackard/netperf)

Note that the iperf2 and iperf3 are not compatible.
See the [Iperf 2 & Iperf 3 Comparison Table](https://iperf2.sourceforge.io/IperfCompare.html).

## Run the container

### iperf2

Official documentation can be found at []().

`iperf` command is installed in the PATH.

```bash
docker run -it --rm iperf2 iperf -s
```

### iperf3

Official documentation can be found at []().

### netperf

Official documentation can be found at []().

```bash
docker run 
```

## Container structure

- `Ubuntu` is used for the base image.
- No `Entrypoint` defined (Same as the base image).
- CMD is `/bin/bash` (Same as the base image).

## Environmental variables

No environmental variables are defined for the container.

## License

[MIT License](./LICENSE)

## Contribution

Any contributions are appreciated.

- Improve Dockerfile or kubernetes manifests.
- Improve documents include README.

and more.
