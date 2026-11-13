# DBMS, RDBMS, and Database Models

> PostgreSQL 17+ · Beginner

## Learning objectives
- Distinguish data, a database, a DBMS, and an RDBMS.
- Explain why relational databases organize information into related tables.
- Recognize relational, document, key-value, graph, and column-family models.
- Choose a database model based on workload requirements rather than hype.

## 1. The vocabulary

- **Data:** recorded facts, such as a customer name or an order amount.
- **Database:** an organized collection of data.
- **DBMS:** software that stores, retrieves, protects, and manages databases.
- **RDBMS:** a DBMS based on the relational model, where data is represented through relations (commonly presented as tables) and integrity rules.

PostgreSQL is an object-relational DBMS with strong relational capabilities. MySQL is a relational DBMS. SQL is the language; PostgreSQL and MySQL are database products.

## 2. Why a DBMS is needed

Imagine an online store saving orders in plain text files. Two users may update the same file at once, a crash may leave partial data, and enforcing that every order belongs to a real customer becomes difficult.

A DBMS provides mechanisms for:
- Concurrent access.
- Durable storage and recovery.
- Constraints and integrity.
- Authentication and authorization.
- Query planning and execution.
- Transactions and isolation.
- Backup and operational maintenance.

## 3. Relational example

A customer and their orders are different kinds of facts, so store them in separate tables:

```sql
CREATE TABLE customers (
    customer_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name TEXT NOT NULL
);

CREATE TABLE orders (
    order_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES customers(customer_id),
    order_date DATE NOT NULL
);
```

The foreign key expresses a rule: an order's customer must exist. This is more reliable than storing an unvalidated customer name in every order row.

## 4. Database model overview

| Model | Typical shape | Useful when |
|---|---|---|
| Relational | Tables and relationships | Integrity, joins, transactions, structured data |
| Document | JSON-like documents | Flexible, nested application records |
| Key-value | Key mapped to value | Fast lookup by key, caching, sessions |
| Graph | Nodes and edges | Relationship traversal and connected data |
| Column-family | Partitioned wide rows | Large distributed workloads with known access patterns |

These are not interchangeable. A system can use more than one database technology, but each addition creates operational complexity.

## 5. Interview questions

**Is PostgreSQL the same as SQL?** No. SQL is a language; PostgreSQL is a DBMS that implements SQL and adds product-specific features.

**Is an RDBMS always better than NoSQL?** No. Select based on consistency needs, query patterns, data shape, scale, operational expertise, and system constraints.

## Practice
1. Explain the difference between a database and a DBMS.
2. Give an example of a foreign-key relationship in a school system.
3. Choose a model for a shopping cart, a social graph, and a financial ledger. Defend each choice.
4. Explain why storing an order and customer in one denormalized text field creates problems.
