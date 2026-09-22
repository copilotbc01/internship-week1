#!/bin/bash

URL="${1:-http://localhost:5001/healthz}"

echo "Checking application health at: $URL"

if curl --fail --silent "$URL" | grep -q '"status":"healthy"'; then
    echo "SUCCESS: Application is healthy"
    exit 0
else
    echo "ERROR: Application health check failed"
    exit 1
fi
