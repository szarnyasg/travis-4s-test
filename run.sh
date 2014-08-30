#!/bin/bash

pkill -f 4s
sleep 1
rm -rf /var/lib/4store/my_repository

echo '[4s-boss]
discovery = sole
nodes = 127.0.0.1

[my_repository]
port = 7890' > /tmp/4store.conf

cat /tmp/4store.conf

4s-boss --config-file /tmp/4store.conf
sleep 1
4s-admin --config-file /tmp/4store.conf create-store --segments=2 my_repository
sleep 1
4s-admin --config-file /tmp/4store.conf list-stores
4s-admin --config-file /tmp/4store.conf start-stores my_repository
sleep 1
4s-import --config-file /tmp/4store.conf -v my_repository railway-xform-1.ttl --format turtle
4s-query --config-file /tmp/4store.conf my_repository "SELECT ?x ?y ?z WHERE { ?x ?y ?z }" -f text --verbose | head -n 20

rm /tmp/4store.conf
