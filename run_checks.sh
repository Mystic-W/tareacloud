#!/usr/bin/env bash
# Helper script to run quick checks. Make executable: chmod +x run_checks.sh
set -euo pipefail

echo "=== docker ps (filtrado) ==="
docker ps --filter "name=pg_db" --filter "name=adminer" || true
echo
echo "=== psql select from personas (run inside container) ==="
docker exec -i pg_db psql -U postgres -d ejemplo -c "SELECT * FROM personas;" || true
echo
echo "=== tail logs postgres ==="
docker logs --tail 100 pg_db || true
