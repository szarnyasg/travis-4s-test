#!/bin/bash

CLUSTERNAME=my_cluster

pkill -f 4s
sleep 1
rm -rf /var/lib/4store/$CLUSTERNAME

sudo touch /etc/4store.conf
sudo chown $USER:$USER /etc/4store.conf
echo '[4s-boss]
discovery = sole
nodes = localhost

[my_cluster]
port = 7890' > /etc/4store.conf


cat /etc/4store.conf

4s-boss --debug
4s-admin create-store --segments=2 $CLUSTERNAME
4s-admin list-nodes
4s-admin list-stores
4s-admin start-stores $CLUSTERNAME

# import and query
4s-import $CLUSTERNAME railway-xform-1.ttl --format turtle -v -v 2>&1
#4s-query $CLUSTERNAME "SELECT ?x ?y ?z WHERE { ?x ?y ?z }" -f text --verbose | head -n 20 2>&1

#ps auxw | grep avah[i]
#service avahi-daemon status

#avahi-browse _4store._tcp
#avahi-browse --all --terminate

#sudo cat /var/log/syslog
