# Constraints: NOT NULL, UNIQUE, CHECK, and DEFAULT

Constraints make invalid states harder to store. They are database-enforced rules, not merely form validation.

## NOT NULL

```sql
CREATE TABLE accounts (
    account_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    account_name TEXT NOT NULL
);
```

The database rejects a row with a NULL account name. An empty string is still a value, so use an additional CHECK if empty strings are invalid.

## UNIQUE

```sql
CREATE TABLE app_users (
    user_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email TEXT NOT NULL UNIQUE
);
```

A unique constraint prevents duplicate non-NULL values. PostgreSQL's default unique constraint permits multiple NULL values because NULLs are distinct for this purpose. If business rules require at most one NULL, use a suitable partial unique index or `NULLS NOT DISTINCT` where appropriate.

## CHECK

```sql
CREATE TABLE inventory (
    product_id BIGINT PRIMARY KEY,
    quantity INTEGER NOT NULL CHECK (quantity >= 0)
);
```

A CHECK passes when its expression is TRUE or UNKNOWN; it fails when FALSE. Therefore, pair it with NOT NULL if NULL must be rejected.

## DEFAULT

```sql
CREATE TABLE events (
    event_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
```

A default is used when the column is omitted or DEFAULT is specified. It does not override an explicitly supplied NULL.

## Naming constraints

Named constraints are easier to maintain:

```sql
CREATE TABLE transfers (
    transfer_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    amount NUMERIC(14,2) NOT NULL,
    CONSTRAINT transfers_amount_positive CHECK (amount > 0)
);
```

## Design principle

Put invariants as close to the data as practical. Validate at the application boundary for a good user experience, but retain database constraints as the final integrity guard.

## Exercises

1. Create a table for course enrolments with a composite unique constraint.
2. Reject negative prices and NULL product names.
3. Explain why CHECK (amount > 0) alone does not reject NULL.
4. Decide whether email uniqueness should be case-sensitive in your application and implement a deliberate policy.
