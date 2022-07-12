#!/bin/sh
# Compile, install, and then load 88x2bu driver used by Cudy AC1300 USB 3.0 WiFi adapter
# Created 20220722 by Jamey Hopkins

SOURCE=/root/RTL88x2BU-Linux-Driver-master.zip
WORKDIR=`echo $SOURCE | sed -E 's|/[^/]+$|/|'`
CURDIR=`pwd`

[ ! -f $SOURCE ] && echo "Source file $SOURCE not found." && exit

cd $WORKDIR
[ ! -d RTL88x2BU-Linux-Driver-master ] && unzip $SOURCE
cd RTL88x2BU-Linux-Driver-master
make clean
make
make install
rmmod 88x2bu
modprobe 88x2bu
lsmod | grep 88x2bu

cd $CURDIR

