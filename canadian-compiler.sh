#!/bin/sh
CONF_FILE=$1

set -e

export PATH=$PATH:/home/build/host-toolchains/x86_64-unknown-linux-gnu/xbin:/home/build/host-toolchains/arm-unknown-linux-gnueabihf/xbin:/home/build/host-toolchains/i686-w64-mingw32/xbin:/home/build/host-toolchains/x86_64-w64-mingw32/xbin
# TODO: properly configure
export PATH=$PATH:/home/build/nfs/x86_64-unknown-linux-gnu/bin

rm tmp/commonToolchain/ tmp/hostlib/ tmp/install/ tmp/patch/ tmp/result/ tmp/build/ -rf
mkdir -p /home/build/tmp/download /home/build/tmp/extract /home/build/tmp/build /home/build/tmp/install
gcc-build-script --toolchainConfig $CONF_FILE dump
gcc-build-script --toolchainConfig $CONF_FILE download
gcc-build-script --toolchainConfig $CONF_FILE extract
mv /home/build/tmp/extract/ /home/build/tmp/patch
gcc-build-script --toolchainConfig $CONF_FILE patch
gcc-build-script --toolchainConfig $CONF_FILE merge
gcc-build-script --toolchainConfig $CONF_FILE buildGMP
gcc-build-script --toolchainConfig $CONF_FILE buildMPFR
gcc-build-script --toolchainConfig $CONF_FILE buildMPC
gcc-build-script --toolchainConfig $CONF_FILE headers1
gcc-build-script --toolchainConfig $CONF_FILE buildBinutils
gcc-build-script --toolchainConfig $CONF_FILE libc
gcc-build-script --toolchainConfig $CONF_FILE finalCompiler
gcc-build-script --toolchainConfig $CONF_FILE cleanup
