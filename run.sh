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

[my_repository]
port = 7890' > /etc/4store.conf

cat /etc/4store.conf

4s-boss
sleep 1
4s-admin create-store --segments=2 my_repository
sleep 1
4s-admin list-stores
4s-admin start-stores my_repository
sleep 1
4s-import -v my_repository railway-xform-1.ttl --format turtle
#4s-httpd my_repository
#4s-query my_repository "SELECT ..."

