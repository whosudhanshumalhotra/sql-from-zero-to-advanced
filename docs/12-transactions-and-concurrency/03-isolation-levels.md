# Transaction Isolation Levels

Isolation controls what effects one transaction can observe from concurrent transactions.

## Common anomalies

- **Dirty read:** reading another transaction's uncommitted change.
- **Non-repeatable read:** reading the same row twice and seeing a committed change between reads.
- **Phantom:** repeating a predicate query and seeing a changed set of qualifying rows.
- **Serialization anomaly:** the combined outcome cannot be explained by any serial ordering of transactions.

## PostgreSQL behaviour

PostgreSQL implements MVCC (multi-version concurrency control). Readers generally see a snapshot rather than blocking on every writer.

PostgreSQL's READ UNCOMMITTED behaves as READ COMMITTED. Under READ COMMITTED, each statement gets a fresh snapshot. Under REPEATABLE READ, a transaction sees a stable snapshot, with serialization anomalies still possible in some patterns. SERIALIZABLE uses Serializable Snapshot Isolation and may abort a transaction that must be retried.

## Practical rule

Choose isolation based on the invariant, not by automatically selecting the strongest level. Use constraints, atomic updates, explicit locks, and retries as appropriate.

## Retry handling

Applications using SERIALIZABLE must be prepared to retry transactions aborted with serialization failures. Retries should be bounded and safe; external side effects must not be repeated blindly.

## Practice
1. Explain why two statements in READ COMMITTED can see different committed values.
2. Describe a lost-update risk in an inventory counter.
3. Explain the difference between locking a row and taking a consistent snapshot.
4. Describe how a serialization retry should be implemented safely.
