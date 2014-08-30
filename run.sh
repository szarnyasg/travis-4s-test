#!/bin/bash

CLUSTERNAME=my_cluster

# show if IPv6 is diabled
cat /etc/avahi/avahi-daemon.conf | grep use-ipv6

# shutdown firewall
sudo iptables -F

# initialize 4store
4s-backend-setup -v $CLUSTERNAME 2>&1
4s-backend $CLUSTERNAME 2>&1
sleep 5

# check if 4store runs
ps auxw | grep 4s-backen[d]
ls -la /var/lib/4store/$CLUSTERNAME

# import and query
4s-import $CLUSTERNAME railway-xform-1.ttl --format turtle -v -v 2>&1
4s-query $CLUSTERNAME "SELECT ?x ?y ?z WHERE { ?x ?y ?z }" -f text --verbose | head -n 20 2>&1

# try connecting with telnet
# telnet localhost 6734

avahi-browse _4store._tcp

sudo cat /var/log/syslog
