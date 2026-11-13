# Contributing Guide

Thank you for helping improve SQL From Zero to Advanced.

## Contribution principles

- Be accurate, beginner-friendly, and technically precise.
- Prefer runnable PostgreSQL examples.
- State the database version when behaviour is version-dependent.
- Never include real credentials, personal data, or production records.
- Mark destructive operations clearly.
- Explain why a query works, not only what to type.

## Lesson format

A good lesson should contain:
1. Learning objectives.
2. Prerequisites.
3. Plain-language explanation.
4. Syntax and rules.
5. Runnable example schema/data.
6. Query and expected output.
7. Logical processing or internal behaviour where relevant.
8. Common mistakes and edge cases.
9. Real-world use cases.
10. Exercises, interview questions, and revision checklist.

## SQL style

- Use uppercase SQL keywords for readability.
- Use meaningful snake_case identifiers.
- Qualify ambiguous columns with table aliases.
- Avoid `SELECT *` in production examples.
- Prefer explicit column lists in `INSERT`.
- Use transactions for multi-step changes where appropriate.
- Explain NULL semantics.
- Include deterministic `ORDER BY` when output order matters.

## Before submitting

- [ ] SQL runs on the documented PostgreSQL version.
- [ ] Expected output matches the query.
- [ ] No unexplained destructive command.
- [ ] Names and formatting are consistent.
- [ ] Links work.
- [ ] Exercises have clear acceptance criteria.
