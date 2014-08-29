#!/bin/bash

4s-backend-setup tb_cluster
4s-backend tb_cluster

4s-import tb_cluster railway-xform-1.ttl --format turtle
