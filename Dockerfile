FROM alpine

ARG ARCH="rv32gc"
ARG ABI="ilp32d"

RUN apk --update add \
            git \
            build-base \
            curl \
            mpc1-dev \
            mpfr-dev \
            gmp-dev \
            gawk \
            alpine-sdk \
            bison \
            flex \
            texinfo \
            gperf \
            libtool \
            patchutils \
            bc \
            zlib-dev \
            expat-dev \
    && rm -rf /var/lib/apt/lists/* \
    && rm /var/cache/apk/*

# Build RISC V toolchain
WORKDIR /opt
RUN git clone https://github.com/riscv/riscv-gnu-toolchain.git \
    && cd riscv-gnu-toolchain \
    && git submodule update --init --recursive
WORKDIR /opt/riscv-gnu-toolchain
RUN ./configure --prefix=/opt/riscv --with-arch=$ARCH --with-abi=$ABI \
    && make

FROM alpine
# Copy artefacts
COPY --from=0 /opt/riscv /opt/riscv
## set path and riscv env
ENV PATH /opt/riscv/bin:$PATH
ENV RISCV /opt/riscv
