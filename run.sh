#!/bin/bash

4s-backend-setup -v tb_cluster
4s-backend -v tb_cluster

4s-import tb_cluster railway-xform-1.ttl --format turtle
4s-query tb_cluster "SELECT ?x ?y ?z WHERE { ?x ?y ?z }" -f text | head -n 20

