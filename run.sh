#!/bin/bash

CLUSTERNAME=my_cluster

# show if IPv6 is diabled
cat /etc/avahi/avahi-daemon.conf | grep use-ipv6

4s-boss
4s-admin create-store --segments=2 $CLUSTERNAME
4s-admin list-stores
4s-admin start-stores $CLUSTERNAME

# import and query
4s-import $CLUSTERNAME railway-xform-1.ttl --format turtle -v -v 2>&1
4s-query $CLUSTERNAME "SELECT ?x ?y ?z WHERE { ?x ?y ?z }" -f text --verbose | head -n 20 2>&1

#ps auxw | grep avah[i]
#service avahi-daemon status

#avahi-browse _4store._tcp
#avahi-browse --all --terminate

#sudo cat /var/log/syslog
