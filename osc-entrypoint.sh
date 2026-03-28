#!/usr/bin/env bash
set -e

# Parse DATABASE_URL into PostgreSQL component variables
if [ -n "$DATABASE_URL" ]; then
  # Extract components from DATABASE_URL (format: postgres://user:password@host:port/dbname)
  DB_PROTO="${DATABASE_URL%%://*}"
  DB_REST="${DATABASE_URL#*://}"
  DB_USERINFO="${DB_REST%%@*}"
  DB_HOSTPATH="${DB_REST#*@}"
  DB_USER="${DB_USERINFO%%:*}"
  DB_PASSWORD="${DB_USERINFO#*:}"
  DB_HOSTPORT="${DB_HOSTPATH%%/*}"
  DB_NAME="${DB_HOSTPATH#*/}"
  DB_HOST="${DB_HOSTPORT%%:*}"
  DB_PORT="${DB_HOSTPORT##*:}"

  export PGHOST="${DB_HOST}"
  export PGPORT="${DB_PORT:-5432}"
  export PGUSER="${DB_USER}"
  export PGPASSWORD="${DB_PASSWORD}"
  export PGDATABASE="${DB_NAME}"
  export POSTGRES_URL="${DATABASE_URL}"
fi

# Map OSC_HOSTNAME to UNLEASH_URL
if [ -n "$OSC_HOSTNAME" ]; then
  export UNLEASH_URL="https://${OSC_HOSTNAME}"
fi

# Handle PORT -> HTTP_PORT mapping
export HTTP_PORT="${PORT:-8080}"

exec "$@"
