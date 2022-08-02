#!/bin/bash
# https://www.postgresql.org/docs/current/static/non-durability.html
cat <<EOF >> /var/lib/postgresql/data/postgresql.conf
fsync = off
synchronous_commit = off
full_page_writes = off
EOF
