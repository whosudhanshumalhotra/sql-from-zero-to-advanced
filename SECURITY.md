# Security Policy

## Scope

This repository is an educational project. The included Docker credentials and sample data are for local learning only. Do not expose this database to a public network or reuse its credentials in another environment.

## Reporting a vulnerability

Do not publish secrets, credentials, personal data, or exploit details in a public issue. Contact the repository maintainer privately through the GitHub profile's available contact method. Include the affected file, impact, reproduction steps, and a suggested mitigation where possible.

## Safe usage

- Use parameterized queries in application code.
- Use least-privilege database roles.
- Never commit `.env` files, credentials, production dumps, or real personal data.
- Review destructive statements before running them.
- Use a disposable local database for transaction and concurrency experiments.
