#!/bin/sh

whoami
startpath=$(pwd)
echo "Started in $startpath"
ls -la
ls -la ${startpath}/buildscripts


cd /home/build
mount nfs
