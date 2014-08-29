#!/bin/bash

CLUSTERNAME=tb_cluster

4s-backend-setup -v $CLUSTERNAME
4s-backend $CLUSTERNAME

ps auxw | grep 4s-backen[d]
ls -la /var/lib/4store
ls -la /var/lib/4store/$CLUSTERNAME

4s-import $CLUSTERNAME railway-xform-1.ttl --format turtle --verbose
4s-query $CLUSTERNAME "SELECT ?x ?y ?z WHERE { ?x ?y ?z }" -f text --verbose | head -n 20

