# Environment Setup

## Docker setup

1. Install Docker Desktop.
2. Open a terminal in the repository root.
3. Run `docker compose up -d`.
4. Check health with `docker compose ps`.
5. Connect using `docker exec -it sql-learning-postgres psql -U learner -d sql_learning`.

The compose credentials are for local learning only. Never reuse them in production.

## Connect using a GUI

Use DBeaver or pgAdmin with:
- Host: `localhost`
- Port: `5432`
- Database: `sql_learning`
- Username: `learner`
- Password: `learner_local_only`

## Native PostgreSQL

Install PostgreSQL 17 or newer, create a database, and execute the scripts in order:

```bash
createdb sql_learning
psql -d sql_learning -f setup/00_create_learning_schema.sql
psql -d sql_learning -f setup/01_seed_learning_data.sql
```

## Troubleshooting

- **Port 5432 already in use:** stop the other PostgreSQL service or change the left side of the compose port mapping, e.g. `5433:5432`.
- **Container exits:** inspect `docker compose logs postgres`.
- **Password authentication fails:** confirm host, port, database, username, and password.
- **Changed init SQL but no changes appear:** Docker's initialization scripts run only when the data directory is empty. For a disposable learning database, `docker compose down -v` then `docker compose up -d` recreates it and deletes its stored data.
- **Connection refused:** wait for the health check and verify `docker compose ps`.

## Reset warning

`docker compose down -v` permanently removes the local named volume and all data stored in this practice database.
