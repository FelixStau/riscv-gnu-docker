#/bin/bash

## 32bit
#ARCH_LIST="rv32gc"
#ABI_LIST="ilp32 ilp32f ilp32d"

## 64bit
ARCH_LIST="rv64gc"
ABI_LIST="lp64 lp64f lp64d"

for ARCH in $ARCH_LIST
do
    for ABI in $ABI_LIST
    do
        echo "Build container.. with (ARCH/ABI): $ARCH/$ABI"
        docker build \
            --tag "felixstau/riscv-gnu-toolchain:${ARCH}_${ABI}" \
            --build-arg ARCH=$ARCH \
            --build-arg ABI=$ABI \
            .

        echo "Push image to dockerhub -> felixstau/riscv-gnu-toolchain:$ARCH_$ABI"
        docker push felixstau/riscv-gnu-toolchain:${ARCH}_${ABI}
    done
done
