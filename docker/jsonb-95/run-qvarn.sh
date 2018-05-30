#!/bin/bash

set -e

# wait for objstore
sleep 10

export QVARN_CONFIG="/etc/qvarn/qvarn.conf"
env/bin/gunicorn \
    --bind 0.0.0.0:8000 \
    --workers 1 \
    --threads 1 \
    --log-level debug \
    --capture-output \
    --limit-request-field_size 0 \
    qvarn.backend:app

