# Start Here — Your First 60 Minutes

Welcome. You do not need prior SQL experience.

## 1. Understand the goal (5 minutes)

SQL is used to define, retrieve, and change data in relational databases. This repository uses PostgreSQL as its main practice database.

## 2. Start your local database (10 minutes)

Install Docker Desktop, open a terminal in the repository folder, and run:

```bash
docker compose up -d
docker compose ps
```

Wait until the PostgreSQL service is healthy. If port 5432 is already in use, create a local `.env` file from `.env.example` and change `POSTGRES_PORT` to `5433` (or another free port).

## 3. Open the SQL prompt (5 minutes)

```bash
docker exec -it sql-learning-postgres psql -U learner -d sql_learning
```

Try:

```sql
SELECT version();
SELECT current_database();
SELECT current_schema();
```

Exit `psql` with `\q`.

## 4. Run your first query (10 minutes)

```sql
SET search_path TO learning, public;

SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC;
```

Before executing, predict which product will appear first. Then change the sort direction and observe the result.

## 5. Follow the curriculum (20 minutes)

Start at [Module 00 — Database Foundations](docs/00-database-foundations/README.md), then continue in numerical order. Do not skip directly to window functions or query tuning.

## 6. Verify the environment (5 minutes)

From the repository root:

```bash
make test
```

If `make` is unavailable, run `./scripts/verify.sh`.

## Learning rule

For every query: predict → write → execute → inspect → explain → modify. Understanding why a query returns its result is more valuable than collecting copied queries.

## If something goes wrong

Read [Environment Setup](setup/README.md), inspect `docker compose logs postgres`, and check the exact error message. Do not delete the database volume unless you intend to erase all local practice data.
