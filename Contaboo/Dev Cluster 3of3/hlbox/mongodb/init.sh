#!/bin/bash

(

# Wait until the local mongod has started listening on all IP addresses. This
# is required for the replicaset init to succeed.
while ! pgrep -xa mongod | fgrep -q -e --bind_ip_all; do
	echo "$0: Waiting for MongoDB to start on all IP addresses"
	sleep 2
done

# Load the mounted init script and just retry until it succeeds
while ! mongod --quiet --eval "load('/init.js')"; do
	echo "$0: Retrying replicaset initialization"
	sleep 60
done
	echo "$0: Replicaset initialization done"

) &
