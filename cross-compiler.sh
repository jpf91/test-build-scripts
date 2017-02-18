#!/bin/sh
CONF_FILE=$1

set -e

export PATH=$PATH:/home/build/host-toolchains/x86_64-unknown-linux-gnu/xbin

rm tmp/commonToolchain/ tmp/hostlib/ tmp/install/ tmp/patch/ tmp/result/ tmp/build/ -rf
mkdir -p /home/build/tmp/download /home/build/tmp/extract /home/build/tmp/build /home/build/tmp/install

#mkdir -p /home/build/nfs/x86_64-unknown-linux-gnu
#ln -s /home/build/nfs/x86_64-unknown-linux-gnu /home/build/tmp/result

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
cp -R /home/build/tmp/result/ /home/build/tmp/stage1/
gcc-build-script --toolchainConfig $CONF_FILE stage1
gcc-build-script --toolchainConfig $CONF_FILE libc
gcc-build-script --toolchainConfig $CONF_FILE finalCompiler
gcc-build-script --toolchainConfig $CONF_FILE cleanup
