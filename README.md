# RISC-V GNU Toolchain

A RISC-V GNU toolchain docker container which provides various compilation of
different architectures(arch) and application binary interfaces(abi).

## Getting Started

These instructions will cover usage information for the docker container.

### Prerequisities

In order to run this container you'll need Docker 17.05 or higher installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

Simple run the container to get a shell.
```shell
docker run -ti felixstau/riscv-gnu-toolchain:latest
```

You can map your project within the container to compile your sources.

```shell
docker run -ti -v "$(pwd)"/my/project:/project felixstau/riscv-gnu-toolchain:latest
```

#### Environment Variables

* `PATH` - The RISC-V toolchain binaries have been added to the PATH
* `RISCV` - THE RISCV variable has been set to the corresponding directory

#### Useful File Locations

* `/opt/riscv` - Location of the RISC-V toolchain

## Build Parameter

The Dockerfile provides two build paremeter with which the compilation process
of the toolchain can be customized. 


* ARCH - Specifies the architecture
* ABI - Specifies the binary aplication interfaces

The variables can be set through the docker build command.
```shell
docker build \
    --tag someTag \
    --build-arg ARCH=someArch \
    --build-arg ABI=someABI \
    .
```
All possible combinations are documented in the RISC-V GNU Toolchain [REAMDE.md](https://github.com/riscv/riscv-gnu-toolchain/blob/master/README.md).

## Find Us

* [GitHub](https://github.com/FelixStau/riscv-gnu-docker)

## Contributing

Please open an issue at [GitHub](https://github.com/FelixStau/riscv-gnu-docker).


## Authors

* **Felix Staudigl** - [](https://github.com/FelixStau)

## License

This project is licensed under the The Unlicense License - see the [LICENSE.md](https://github.com/FelixStau/riscv-gnu-docker/blob/master/LICENSE) file for details.
