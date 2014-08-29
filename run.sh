#!/bin/bash

CLUSTERNAME=tb_cluster

sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT

4s-backend-setup -v $CLUSTERNAME
4s-backend $CLUSTERNAME

ps auxw | grep 4s-backen[d]
ls -la /var/lib/4store
ls -la /var/lib/4store/$CLUSTERNAME

sleep 5

4s-import $CLUSTERNAME railway-xform-1.ttl --format turtle --verbose
4s-query $CLUSTERNAME "SELECT ?x ?y ?z WHERE { ?x ?y ?z }" -f text --verbose | head -n 20

cat /var/log/messages
