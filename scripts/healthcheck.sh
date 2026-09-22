#!/bin/bash

URL="${1:-http://localhost:5001/healthz}"

echo "=== System & Application Health Check ==="

echo ""
echo "--- System Resources ---"
echo "CPU:"
top -l 1 | grep "CPU usage"

echo ""
echo "Memory:"
vm_stat | head -5

echo ""
echo "Disk:"
df -h /

echo ""
echo "--- Docker ---"
if docker info >/dev/null 2>&1; then
    echo "SUCCESS: Docker daemon is running"
else
    echo "ERROR: Docker daemon is not running"
fi

echo ""
echo "--- Application ---"
echo "Checking: $URL"

if curl --fail --silent "$URL" | grep -q '"status":"healthy"'; then
    echo "SUCCESS: Application is healthy"
    exit 0
else
    echo "ERROR: Application health check failed"
    exit 1
fi
