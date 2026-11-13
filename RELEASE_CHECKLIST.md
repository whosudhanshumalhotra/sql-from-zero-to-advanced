# Release Checklist

## Repository contents

- [x] Beginner entry point and complete module navigation.
- [x] 17 ordered curriculum modules.
- [x] 78 lesson files with objectives, examples, exercises, and interview prompts.
- [x] Topic-specific deep dives added across the lesson set.
- [x] PostgreSQL schema and deterministic sample data.
- [x] Seed script designed to be repeatable using unique constraints and conflict handling.
- [x] Docker Compose environment bound to localhost by default.
- [x] Query examples, practice ladder, worked interview solutions, and project specifications.
- [x] Security, support, contribution, and license documentation.
- [x] GitHub Actions workflow for PostgreSQL 17 schema, seed repeatability, and smoke tests.
- [x] Local verification script and Makefile commands.

## Static checks performed for this packaged release

- [x] All relative Markdown file links resolve.
- [x] Docker Compose YAML parses successfully.
- [x] GitHub Actions workflow YAML parses successfully.
- [x] Schema and seed files contain the expected product uniqueness/conflict rule for repeatable seeding.

## Runtime verification status

The authoring environment used to assemble this archive did not have Docker or `psql` installed, so a live PostgreSQL execution was not claimed here. The repository includes a GitHub Actions workflow that provisions PostgreSQL 17 and performs the runtime smoke tests on push and pull request. Review the Actions result after publishing to GitHub.

## Compatibility and maintenance

The executable examples target PostgreSQL 17+. SQL dialects and database releases evolve; check official documentation when adapting examples to another engine or a later major release. This repository is a learning and portfolio project, not a certified production database platform.
