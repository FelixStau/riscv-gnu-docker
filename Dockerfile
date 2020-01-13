FROM docker.io/teeks99/boost-cpp-docker:gcc-9

RUN apt-get update \
    && apt-get install -y \
            autoconf \
            automake \
            autotools-dev \
            curl \
            libmpc-dev \
            libmpfr-dev \
            libgmp-dev \
            gawk \
            build-essential \
            bison \
            flex \
            texinfo \
            gperf \
            libtool \
            patchutils \
            bc \
            zlib1g-dev \
            libexpat-dev \
    && rm -rf /var/lib/apt/lists/*

# Build RISC V toolchain
WORKDIR /opt
RUN git clone https://github.com/riscv/riscv-gnu-toolchain.git \
    && cd riscv-gnu-toolchain \
    && git submodule update --init --recursive
WORKDIR /opt/riscv-gnu-toolchain
RUN ./configure --prefix=/opt/riscv --with-arch=rv32imac --with-abi=ilp32 \
    && make
## Add binary to PATH
ENV PATH /opt/riscv/bin:$PATH
## cleanup
RUN rm -rf /opt/riscv-gnu-toolchain
