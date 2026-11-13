# ACID Properties

A transaction is a logical unit of work. ACID describes four properties that help make transaction outcomes reliable.

## Atomicity

All operations in a transaction succeed together or are rolled back together.

Example: a bank transfer must debit one account and credit another. A debit without the corresponding credit is an invalid partial outcome.

## Consistency

A transaction must preserve declared database invariants. Constraints, foreign keys, checks, and application rules help define valid states.

Consistency does not mean every business rule is automatically known by the database. You must model and enforce the rules.

## Isolation

Concurrent transactions should not interfere in ways that violate the guarantees of the selected isolation level. Stronger isolation can require more coordination and may cause retries.

## Durability

After a transaction commits successfully, its effects should survive failures within the database's durability guarantees and configuration.

## Example: transfer outline

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 10
  AND balance >= 500;

-- Application must verify exactly one row was updated.
UPDATE accounts
SET balance = balance + 500
WHERE account_id = 20;

-- Verify both account updates and ledger records.
COMMIT;
```

This is only an outline: production transfer logic needs a consistent lock order, row-count checks, ledger design, idempotency, error handling, and a clear policy for insufficient funds and missing accounts.

## Interview follow-ups

- Does ACID mean a transaction can never fail? No. It means the database provides defined transaction guarantees; callers must handle errors and retries.
- Is consistency the same as isolation? No. Consistency concerns valid states; isolation concerns concurrent transaction interactions.
- Is a successful commit always durable under every possible hardware failure? Durability depends on the database's guarantees and configuration, storage stack, and failure model. Do not disable durability settings casually.
