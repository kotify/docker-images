#!/bin/bash
# https://www.postgresql.org/docs/current/static/non-durability.html
cat <<EOF >> /var/lib/postgresql/data/postgresql.conf
fsync = off
synchronous_commit = off
full_page_writes = off
max_wal_size = '4GB'
checkpoint_timeout = '1d'

max_connections = 200
max_locks_per_transaction = 128
wal_level = minimal
max_wal_senders = 0
EOF
