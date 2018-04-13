#!/bin/sh

# wait for postgres
sleep 5

/opt/qvarn/env/bin/qvarn run --host 0.0.0.0 --port 8000
