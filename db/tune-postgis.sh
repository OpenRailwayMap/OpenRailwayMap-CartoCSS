#!/bin/sh

set -e
export PGUSER="$POSTGRES_USER"

psql -c "ALTER SYSTEM SET work_mem='${PG_WORK_MEM:-50MB}';"
psql -c "ALTER SYSTEM SET maintenance_work_mem='${PG_MAINTENANCE_WORK_MEM:-2GB}';"
psql -c "ALTER SYSTEM SET autovacuum_work_mem='1GB';"
psql -c "ALTER SYSTEM SET shared_buffers='1GB';"
psql -c "ALTER SYSTEM SET wal_level='minimal';"
psql -c "ALTER SYSTEM SET max_wal_senders=0;"
psql -c "ALTER SYSTEM SET checkpoint_timeout='60min';"
psql -c "ALTER SYSTEM SET random_page_cost=0.1;"
