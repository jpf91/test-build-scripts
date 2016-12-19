#!/bin/bash

# build dmd, druntime, phobos
build() {
    make -j4 -C src -f posix.mak MODEL=64 HOST_DMD=gdmd ENABLE_RELEASE=1 all
    make -j4 -C src -f posix.mak MODEL=64 HOST_DMD=gdmd dmd.conf
    make -j4 -C ../druntime -f posix.mak MODEL=64
    make -j4 -C ../phobos -f posix.mak MODEL=64
}

# self-compile dmd
rebuild() {
    mv src/dmd src/host_dmd
    make -j4 -C src -f posix.mak MODEL=64 HOST_DMD=./host_dmd clean
    make -j4 -C src -f posix.mak MODEL=64 HOST_DMD=./host_dmd dmd.conf
    make -j4 -C src -f posix.mak MODEL=64 HOST_DMD=./host_dmd ENABLE_RELEASE=1 all
}

# test druntime, phobos, dmd
test() {
    make -j4 -C ../druntime -f posix.mak MODEL=64 unittest
    make -j4 -C ../phobos -f posix.mak MODEL=64 unittest
    test_dmd
}

# test dmd
test_dmd() {
    make -j4 -C test MODEL=64 # all ARGS by default
}


startpath=$(pwd)

wget 'https://raw.githubusercontent.com/D-Programming-GDC/GDMD/master/dmd-script' -O gdcBin/x86_64-unknown-linux-gnu/bin/gdmd
chmod +x gdcBin/x86_64-unknown-linux-gnu/bin/gdmd

export PATH=$PATH:${startpath}/gdcBin/x86_64-unknown-linux-gnu/bin

cd dmd
for step in build test rebuild rebuild test_dmd; do
    $step
    date
done
