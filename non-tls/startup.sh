#!/bin/sh

if [ -z $SWARM_MODE ]; then
    SWARM_MODE=false
fi

traefik --api  --docker --docker.watch --docker.domain=docker.localhost --docker.swarmMode=$SWARM_MODE \
--ping --ping.entryPoint=http \
--metrics.prometheus \
--entrypoints='Name:http Address::80' \
--retry \
--loglevel=$LOG_LEVEL
