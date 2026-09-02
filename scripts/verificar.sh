#!/usr/bin/env bash
set -Eeuo pipefail
BASE_URL=${1:-http://127.0.0.1:${FRONTEND_PORT:-80}}
wait_http(){ for _ in $(seq 1 90); do curl -fsS "$1" >/dev/null && return; sleep 1; done; return 1; }
wait_http "$BASE_URL/health"; curl -fsS "$BASE_URL/" | grep -q 'Notes App'; curl -fsS "$BASE_URL/api/notes" | jq -e 'type=="array"' >/dev/null
id=$(curl -fsS -X POST -H 'Content-Type: application/json' -d '{"title":"validacion","content":"persistencia"}' "$BASE_URL/api/notes" | jq -er .id)
curl -fsS "$BASE_URL/api/notes/$id" | jq -e '.title=="validacion"' >/dev/null
curl -fsS -X DELETE "$BASE_URL/api/notes/$id" | jq -e '.message=="nota eliminada"' >/dev/null
echo "CRUD verificado en $BASE_URL"

