#!/usr/bin/env bash
set -euo pipefail

: "${DATABASE_URL:=postgresql://learner:learner_local_only@localhost:5432/sql_learning}"
export DATABASE_URL

psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f tests/verify_database.sql
