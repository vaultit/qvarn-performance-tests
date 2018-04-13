#!/bin/bash

set -e

# wait for postgres
sleep 5

export QVARN_CONFIG="${QVARN_CONFIG:-/etc/qvarn/qvarn-no-alog.conf}"
echo "Using config: ${QVARN_CONFIG}"

env/bin/gunicorn \
    --bind 0.0.0.0:8000 \
    --workers 1 \
    --threads 1 \
    --log-level debug \
    --capture-output \
    --limit-request-field_size 0 \
    qvarn.backend:app

