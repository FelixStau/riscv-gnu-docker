FROM gcc:9

ARG BUILD_PARAMETER="--enable-multilib"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
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
RUN ./configure --prefix=/opt/riscv $BUILD_PARAMETER \
    && make

FROM gcc:9
# Copy artefacts
COPY --from=0 /opt/riscv /opt/riscv
## set path and riscv env
ENV PATH /opt/riscv/bin:$PATH
ENV RISCV /opt/riscv
