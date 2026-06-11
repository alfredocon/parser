#!/bin/sh
set -e

echo "[.] Init..."

# Volume mount check
mkdir -p /app/domain /app/output/data /app/logs /app/cache

[ -d /opt/domain ] && cp -r /opt/domain/* /app/domain/
[ -d /opt/output ] && cp -r /opt/output/* /app/output/

exec node /opt/parser/parser.bundle.js
