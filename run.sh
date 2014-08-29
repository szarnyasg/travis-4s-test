#!/bin/bash

4s-backend-setup my_cluster
4s-backend my_cluster

4s-import my_cluster railway-xform-1.ttl --format turtle
