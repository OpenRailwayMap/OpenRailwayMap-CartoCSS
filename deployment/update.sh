#!/usr/bin/env bash

cd /home/openrailwaymap/OpenRailwayMap-vector

exec docker compose pull db martin martin-proxy api
