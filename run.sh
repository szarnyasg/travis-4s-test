#!/bin/bash

CLUSTERNAME=tb_cluster

4s-backend-setup -v $CLUSTERNAME
4s-backend $CLUSTERNAME

ps auxw | grep 4s-backen[d]

4s-import $CLUSTERNAME railway-xform-1.ttl --format turtle
4s-query $CLUSTERNAME "SELECT ?x ?y ?z WHERE { ?x ?y ?z }" -f text | head -n 20

