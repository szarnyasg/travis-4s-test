#!/bin/bash

4s-backend-setup trainbenchmark_cluster
4s-backend trainbenchmark_cluster

4s-import trainbenchmark_cluster railway-xform-1.ttl --format turtle
