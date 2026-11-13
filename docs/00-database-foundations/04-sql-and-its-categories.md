# What Is SQL? DDL, DML, DQL, DCL, and TCL

## SQL is declarative

SQL describes **what result or data change is required**, while the database engine decides how to execute it. You normally do not specify a loop over disk pages or the exact join algorithm.

```sql
SELECT product_name, unit_price
FROM learning.products
WHERE unit_price > 3000;
```

This describes the requested rows and columns. The optimizer chooses a plan.

## Common command categories

| Category | Purpose | Examples |
|---|---|---|
| DQL | Query data | SELECT |
| DML | Change rows | INSERT, UPDATE, DELETE, MERGE |
| DDL | Define database objects | CREATE, ALTER, DROP, TRUNCATE |
| DCL | Control privileges | GRANT, REVOKE |
| TCL | Control transactions | BEGIN, COMMIT, ROLLBACK, SAVEPOINT |

Some books classify SELECT differently or group commands differently. The categories are a learning aid, not a strict boundary in every SQL reference.

## Example of each category

```sql
-- DDL: define structure
CREATE TABLE demo_notes (
    note_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    body TEXT NOT NULL
);

-- DML: insert a row
INSERT INTO demo_notes (body) VALUES ('Learn SQL deliberately');

-- DQL: retrieve rows
SELECT note_id, body FROM demo_notes;

-- TCL: undo a change
BEGIN;
UPDATE demo_notes SET body = 'Temporary change' WHERE note_id = 1;
ROLLBACK;
```

DCL examples require a role and appropriate privileges; do not practise GRANT/REVOKE on a shared production database.

## Important distinction

DDL transaction behaviour differs among database products and commands. PostgreSQL supports transactional execution for many DDL statements, while other systems have implicit-commit rules in various cases. Always verify the target database's documentation.

## Practice
1. Categorize `CREATE INDEX`, `UPDATE`, `SELECT`, `GRANT`, and `COMMIT`.
2. Write a transaction that inserts a row and rolls it back.
3. Explain why a SELECT query can still consume substantial CPU, memory, and I/O.
