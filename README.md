# SQL From Zero to Advanced

> A structured, hands-on SQL curriculum taking you from your first query to advanced database engineering, analytics, optimization, and interview readiness.

![SQL](https://img.shields.io/badge/SQL-Learning%20Path-blue)
![PostgreSQL](https://img.shields.io/badge/Primary%20Database-PostgreSQL-336791)
![Level](https://img.shields.io/badge/Level-Beginner%20to%20Advanced-success)
![License](https://img.shields.io/badge/License-MIT-green)

**Learn SQL by understanding it, practising it, and building with it.** This repository is designed for learners who are starting from zero as well as developers preparing for backend, data analyst, data engineering, and database-focused roles.

## Start here

New to SQL? Follow [START_HERE.md](START_HERE.md) to get your database running and execute your first query.

## What you will learn

- Relational database fundamentals and data modelling.
- SQL syntax, filtering, sorting, grouping, joins, and subqueries.
- Constraints, keys, normalization, and schema design.
- PostgreSQL data types, functions, views, indexes, and sequences.
- Transactions, ACID, isolation levels, locks, and concurrency.
- CTEs, recursive queries, window functions, and advanced analytics.
- Query plans, indexing strategies, and performance tuning.
- Database security, roles, permissions, backups, and migrations.
- Practical SQL for analytics and application development.

## Learning philosophy

Every substantial lesson should answer these questions:

1. **What is it?** Define the concept in plain language.
2. **Why does it exist?** Explain the problem it solves.
3. **How does it work?** Cover logical behaviour and relevant internals.
4. **How do I use it?** Show runnable SQL and expected results.
5. **What can go wrong?** Explain common mistakes and edge cases.
6. **Where is it used?** Connect it to real applications.
7. **Can I solve it?** Practise progressively harder problems.
8. **Can I explain it?** Prepare interview answers and follow-ups.
9. **Can I build with it?** Apply it in realistic projects.
10. **Can I verify it?** Use checks, tests, and performance evidence.

## Technology choices

| Area | Choice |
|---|---|
| Primary SQL dialect | PostgreSQL |
| Learning baseline | PostgreSQL 17+ |
| Optional comparison | MySQL 8.0+ |
| Local environment | Docker Compose or native installation |
| SQL client | pgAdmin, DBeaver, or `psql` |
| Version control | Git and GitHub |

SQL has multiple dialects. Core concepts transfer across database systems, but syntax, data types, functions, and behaviour can differ. PostgreSQL is the primary executable environment in this repository; MySQL differences are called out where useful.

## Prerequisites

- No prior SQL knowledge is required.
- A computer with Windows, macOS, or Linux.
- Basic computer literacy.
- Curiosity and consistent practice.

## Quick start

### Option A: Docker (recommended)

Install Docker Desktop, then from the repository root:

```bash
docker compose up -d
docker compose ps
```

Connect using:

```bash
docker exec -it sql-learning-postgres psql -U learner -d sql_learning
```

Stop the database:

```bash
docker compose down
```

Remove the database volume (destructive: deletes local practice data):

```bash
docker compose down -v
```

### Option B: Existing PostgreSQL installation

Create a database:

```sql
CREATE DATABASE sql_learning;
```

Connect with `psql`:

```bash
psql -U postgres -d sql_learning
```

Run the starter schema:

```bash
psql -U postgres -d sql_learning -f setup/00_create_learning_schema.sql
psql -U postgres -d sql_learning -f setup/01_seed_learning_data.sql
```

See [setup/README.md](setup/README.md) for detailed instructions and troubleshooting. Run `make test` (or `./scripts/verify.sh`) after setup to verify the seeded database. The GitHub Actions workflow repeats the seed script and runs smoke tests on PostgreSQL 17.

## Complete curriculum

| # | Module | Topics |
|---:|---|---|
| 00 | [Database Foundations](docs/00-database-foundations/README.md) | Data, databases, DBMS, relational model, SQL, schemas |
| 01 | [Environment & First Query](docs/01-environment-and-first-query/README.md) | PostgreSQL, clients, databases, first SELECT |
| 02 | [SQL Fundamentals](docs/02-sql-fundamentals/README.md) | SELECT, aliases, DISTINCT, expressions, NULL |
| 03 | [Filtering & Sorting](docs/03-filtering-and-sorting/README.md) | WHERE, operators, LIKE, IN, BETWEEN, ORDER BY |
| 04 | [Data Definition](docs/04-data-definition/README.md) | CREATE, ALTER, DROP, data types, constraints |
| 05 | [Data Manipulation](docs/05-data-manipulation/README.md) | INSERT, UPDATE, DELETE, RETURNING |
| 06 | [Functions & Expressions](docs/06-functions-and-expressions/README.md) | String, numeric, date/time, conditional, aggregate functions |
| 07 | [Grouping & Aggregation](docs/07-grouping-and-aggregation/README.md) | GROUP BY, HAVING, aggregate logic |
| 08 | [Joins](docs/08-joins/README.md) | INNER, LEFT, RIGHT, FULL, CROSS, self joins |
| 09 | [Subqueries & Set Operations](docs/09-subqueries-and-set-operations/README.md) | Scalar, correlated, EXISTS, UNION, INTERSECT, EXCEPT |
| 10 | [Database Design](docs/10-database-design/README.md) | ER modelling, keys, relationships, normalization |
| 11 | [Advanced SQL](docs/11-advanced-sql/README.md) | CTEs, recursive CTEs, window functions, CASE |
| 12 | [Transactions & Concurrency](docs/12-transactions-and-concurrency/README.md) | ACID, COMMIT, ROLLBACK, isolation, locks, deadlocks |
| 13 | [Indexes & Performance](docs/13-indexes-and-performance/README.md) | Index types, EXPLAIN, plans, tuning |
| 14 | [Views, Procedures & Triggers](docs/14-views-procedures-triggers/README.md) | Views, materialized views, functions, procedures, triggers |
| 15 | [Security & Operations](docs/15-security-and-operations/README.md) | Roles, privileges, injection, backup, restore, migrations |
| 16 | [Analytics SQL](docs/16-analytics-sql/README.md) | Cohorts, retention, funnels, ranking, reporting |
| 17 | [Interview Preparation](interview-preparation/README.md) | Core, advanced, scenario-based and query interviews |
| 18 | [Practice Problems](practice/README.md) | Topic-wise problem sets and challenge ladder |
| 19 | [Projects](projects/README.md) | End-to-end database projects |

## Recommended learning sequence

Do not try to memorize every command. Follow the modules in order, run every example, and solve the exercises before reading solutions.

**Suggested daily routine (6 hours):**
- 2 hours: learn concepts and take notes.
- 2 hours: write and modify SQL queries.
- 1 hour: solve practice problems.
- 1 hour: explain concepts aloud, review mistakes, and commit progress.

## Progress tracker

- [ ] 00 — Database Foundations
- [ ] 01 — Environment & First Query
- [ ] 02 — SQL Fundamentals
- [ ] 03 — Filtering & Sorting
- [ ] 04 — Data Definition
- [ ] 05 — Data Manipulation
- [ ] 06 — Functions & Expressions
- [ ] 07 — Grouping & Aggregation
- [ ] 08 — Joins
- [ ] 09 — Subqueries & Set Operations
- [ ] 10 — Database Design
- [ ] 11 — Advanced SQL
- [ ] 12 — Transactions & Concurrency
- [ ] 13 — Indexes & Performance
- [ ] 14 — Views, Procedures & Triggers
- [ ] 15 — Security & Operations
- [ ] 16 — Analytics SQL
- [ ] 17 — Interview Preparation
- [ ] 18 — Practice Problems
- [ ] 19 — Projects

## Projects

1. **Library Management Database** — relationships, constraints, joins, overdue reports.
2. **E-commerce Database** — products, customers, orders, inventory, transactions.
3. **Banking & Transaction System** — ACID, concurrency, ledger consistency.
4. **Employee Analytics** — joins, CTEs, window functions, business KPIs.
5. **Food Delivery Analytics** — funnels, delivery SLAs, retention, cohort analysis.

Project specifications and acceptance criteria live in [projects/](projects/).

## Repository structure

```text
sql-from-zero-to-advanced/
├── README.md
├── CONTRIBUTING.md
├── SECURITY.md
├── SUPPORT.md
├── LICENSE
├── CHANGELOG.md
├── .gitignore
├── docker-compose.yml
├── setup/
├── tests/
├── .github/workflows/
├── docs/
│   ├── 00-database-foundations/
│   ├── 01-environment-and-first-query/
│   └── ... 16-analytics-sql/
├── examples/
│   ├── queries/
│   └── expected-results/
├── practice/
├── interview-preparation/
├── projects/
├── cheat-sheets/
├── resources/
└── scripts/
```

## How to use this repository

- Read the module overview before opening individual lessons.
- Type the queries yourself; do not only copy and paste.
- Predict the result before executing a query.
- Compare your result with the expected output.
- Change one condition at a time and observe the difference.
- Complete exercises without looking at solutions.
- Use Git commits to record meaningful progress.

## Verification and quality standards

Run `make test` after starting the local database. The automated GitHub Actions workflow creates a fresh PostgreSQL 17 service, applies the schema, runs the seed script twice to check repeatability, and executes smoke tests. A passing smoke test verifies baseline row counts and selected relational invariants; it does not replace production load, security, migration, or application integration testing.

## Quality standards

A lesson is considered complete only when:
- Its explanations are understandable without external prerequisites.
- SQL examples run on the stated PostgreSQL baseline.
- Expected behaviour and important edge cases are documented.
- Exercises have clear requirements and difficulty labels.
- Destructive commands are clearly identified.
- Interview answers explain reasoning, not just definitions.
- Performance claims are supported by a query plan or reproducible test.

## Useful resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [PostgreSQL Tutorial](https://www.postgresql.org/docs/current/tutorial.html)
- [SQL Standard overview](https://www.iso.org/standard/76583.html)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Use The Index, Luke](https://use-the-index-luke.com/)
- [Explain PostgreSQL](https://explain.dalibo.com/)

## Repository safety

The Docker database binds to loopback (`127.0.0.1`) by default and uses sample-only credentials. Do not expose it to a public network. See [SECURITY.md](SECURITY.md). The `make reset` command deletes the local database volume and all practice data.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Corrections, clearer explanations, new exercises, and tested examples are welcome.

## License

MIT — see [LICENSE](LICENSE).
