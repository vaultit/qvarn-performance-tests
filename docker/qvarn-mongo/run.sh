#!/bin/bash

set -e

# wait for postgres
sleep 5

export QVARN_CONFIG=/etc/qvarn.conf

env/bin/gunicorn \
    --bind 0.0.0.0:9004 \
    --workers 1 \
    --threads 1 \
    --log-level debug \
    --capture-output \
    --limit-request-field_size 0 \
    --timeout 300 \
    qvarn.backend:app
