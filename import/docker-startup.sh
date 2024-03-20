#!/bin/bash

set -e
set -o pipefail

# Testing if database is ready
i=1
MAXCOUNT=60
echo "Waiting for PostgreSQL to be running"
while [ $i -le $MAXCOUNT ]
do
  pg_isready -q && echo "PostgreSQL running" && break
  sleep 2
  i=$((i+1))
done
test $i -gt $MAXCOUNT && echo "Timeout while waiting for PostgreSQL to be running"

echo "Creating default database"
psql -c "SELECT 1 FROM pg_database WHERE datname = 'gis';" | grep -q 1 || createdb gis
psql -d gis -c 'CREATE EXTENSION IF NOT EXISTS postgis;'
psql -d gis -c 'CREATE EXTENSION IF NOT EXISTS hstore;'

echo "Using osm2psql cache ${OSM2PGSQL_CACHE:-256}MB, ${OSM2PGSQL_NUMPROC:-4} processes and data file ${OSM2PGSQL_DATAFILE:-data.osm.pbf}"

echo "Importing data"
# Importing data to a database
osm2pgsql \
  --create \
  --database gis \
  --drop \
  --slim \
  --output flex \
  --style openrailwaymap.lua \
  --cache "${OSM2PGSQL_CACHE:-256}" \
  --number-processes "${OSM2PGSQL_NUMPROC:-4}" \
  "/data/${OSM2PGSQL_DATAFILE:-data.osm.pbf}"

echo "Post processing imported data"
psql -d gis -f sql/functions.sql
psql -d gis -f sql/get_station_importance.sql
psql -d gis -f sql/signals_with_azimuth.sql
psql -d gis -f sql/tile_views.sql

echo "Import summary"
psql -d gis -c "select table_name as table, pg_size_pretty(pg_total_relation_size(quote_ident(table_name))) as size from information_schema.tables where table_schema = 'public' order by table_name;"
psql -d gis -c "select pg_size_pretty(sum(pg_total_relation_size(quote_ident(table_name)))) as total_size from information_schema.tables where table_schema = 'public';"