#!/bin/bash

CLUSTERNAME=my_cluster

# show if IPv6 is diabled
cat /etc/avahi/avahi-daemon.conf | grep use-ipv6

# shutdown firewall
sudo iptables -F

# initialize 4store
4s-backend-setup -v $CLUSTERNAME
4s-backend $CLUSTERNAME
sleep 5

# check if 4store runs
ps auxw | grep 4s-backen[d]
ls -la /var/lib/4store/$CLUSTERNAME

# import and query
4s-import $CLUSTERNAME railway-xform-1.ttl --format turtle --verbose
4s-query $CLUSTERNAME "SELECT ?x ?y ?z WHERE { ?x ?y ?z }" -f text --verbose | head -n 20

cat /var/log/syslog
