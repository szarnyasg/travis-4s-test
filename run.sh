#!/bin/bash

# source:  http://wiki.ros.org/zeroconf_avahi/Tutorials/Debugging%20with%20Avahi%20Command%20Line%20Tools
avahi-publish -s DudeMaster _ros-master._tcp 8889 &

sleep 5

avahi-browse --all --terminate | grep -i dude
