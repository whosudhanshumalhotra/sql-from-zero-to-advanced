# Database Verification

The smoke test checks the expected seeded row counts and key relational invariants.

Run locally after starting Docker Compose:

```bash
./scripts/verify.sh
```

Or run directly:

```bash
psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f tests/verify_database.sql
```

The GitHub Actions workflow provisions PostgreSQL 17, creates the schema, runs the seed script twice to check idempotency, and executes the smoke tests.

These are baseline integration checks, not a substitute for application-level tests, load tests, security review, or production migration testing.
