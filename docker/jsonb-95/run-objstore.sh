#!/bin/bash

set -e

# wait for postgres
sleep 5

env/bin/python objstore_postgres -c /etc/qvarn/objstore_postgres.conf --port 12765
