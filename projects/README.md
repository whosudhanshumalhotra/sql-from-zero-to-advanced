# SQL Projects

Build these projects in increasing complexity. Each project should have a README, ER diagram, schema scripts, seed data, analytical queries, test cases, and documented design decisions.

## Project 1 — Library Management Database

**Goal:** Manage books, authors, members, loans, returns, and overdue books.

Core requirements:
- Model authors and books (many-to-many).
- Track members and book copies.
- Prevent a copy from being loaned twice while currently on loan.
- Report overdue loans and popular books.
- Add constraints and useful indexes.

Stretch goals: fines, reservations, audit history, and transaction-safe checkout.

## Project 2 — E-commerce Database

**Goal:** Model customers, products, inventory, orders, order items, payments, and shipments.

Core requirements:
- Preserve purchase-time price in order items.
- Enforce positive quantities and non-negative stock.
- Calculate order totals.
- Produce customer lifetime value and product revenue reports.
- Use transactions for order placement and inventory changes.

Stretch goals: refunds, coupons, stock movement ledger, and idempotent payment events.

## Project 3 — Banking & Transaction System

**Goal:** Model accounts, ledger entries, transfers, and statements.

Core requirements:
- Represent money using exact numeric types, not floating point.
- Record balanced debit/credit ledger entries.
- Make transfers atomic.
- Prevent lost updates and invalid balances.
- Explain isolation and locking choices.

Stretch goals: idempotency keys, audit trail, reconciliation, and concurrent transfer tests.

## Project 4 — Employee Analytics

**Goal:** Analyse workforce composition, salary distribution, hiring trends, and attrition.

Core requirements:
- Department-wise headcount and average salary.
- Salary ranking with ties.
- Monthly hiring trend.
- Employee tenure bands.
- Clear metric definitions and NULL handling.

Stretch goals: retention cohorts and manager span-of-control analysis.

## Project 5 — Food Delivery Analytics

**Goal:** Analyse orders, restaurants, delivery partners, delivery times, and customer behaviour.

Core requirements:
- Funnel from order placed to delivered.
- Average delivery time and SLA breach rate.
- Monthly active customers.
- Repeat-order rate.
- Cohort retention.

Stretch goals: peak-hour analysis and delivery-partner utilization.

## Definition of done

- [ ] Requirements and assumptions documented.
- [ ] ER diagram included.
- [ ] DDL and seed scripts run from a clean database.
- [ ] Constraints enforce important invariants.
- [ ] At least 15 meaningful queries included.
- [ ] Edge cases tested.
- [ ] Index choices justified with query plans.
- [ ] README explains how to reproduce the project.
