#!/bin/sh

mount /home/build/nfs
mkdir -p /home/build/nfs/download
mkdir -p /home/build/tmp/
ln -s /home/build/nfs/download /home/build/tmp/download
ln -s ${PWD}/gdc /home/build/tmp/GDC
