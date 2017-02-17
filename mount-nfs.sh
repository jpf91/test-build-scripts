#!/bin/sh

mount /home/build/nfs
mkdir -p /home/build/nfs/download
ln -s /home/build/nfs/download /home/build/tmp/download
ln -s ${PWD}/gdc /home/build/tmp/GDC
