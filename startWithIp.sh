#!/bin/sh
rm -f ../etc/org.oasis_open.contextserver.web.cfg
IP=$1
if [ -z "$1" ]
then
    IP=`/sbin/ifconfig eth0 | grep inet | awk '{print $2}' | sed 's/addr://' | grep .`
fi
echo contextserver.address=$IP >> ../etc/org.oasis_open.contextserver.web.cfg
echo contextserver.port=8181 >> ../etc/org.oasis_open.contextserver.web.cfg
echo contextserver.secureAddress=$IP >> ../etc/org.oasis_open.contextserver.web.cfg
echo contextserver.securePort=9443 >> ../etc/org.oasis_open.contextserver.web.cfg

# export KARAF_DEBUG=true
./karaf ${2:-start}
