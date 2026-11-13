# Candidate, Primary, Foreign, and Composite Keys

> Module: Database Design · Primary dialect: PostgreSQL 17+

## Learning objectives

By the end of this lesson, you should be able to:
- Explain **candidate, primary, foreign, and composite keys** in your own words.
- Identify the problem this concept solves.
- Write and read the relevant SQL confidently.
- Recognize common mistakes and edge cases.
- Apply the concept to a realistic relational database.

## 1. Start with the idea

SQL is a language for describing operations on relational data. A useful habit is to begin with the question you want the database to answer, then translate that question into a query.

Do not memorize syntax without understanding the shape of the data and the result you expect.

## 2. Why this matters

In a real application, data is shared by multiple users and processes. Queries must be correct, predictable, secure, and maintainable. The concept in this lesson contributes to one or more of those requirements.

## 3. Working environment

Run the shared setup scripts from the repository root. The examples use the `learning` schema:

```sql
SET search_path TO learning, public;

SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY employee_id;
```

Expected result: the seeded employee records, ordered by `employee_id`. Exact generated identity values depend on whether you reset the local database.

## 4. A repeatable way to learn the syntax

When learning a new SQL construct:

1. Identify the input table or tables.
2. Decide which rows should qualify.
3. Decide which columns or expressions should appear.
4. Consider duplicates and NULL values.
5. Add ordering only when the result needs a guaranteed order.
6. Run the query and compare it with your prediction.

## Topic-specific deep dive

A superkey uniquely identifies rows; a candidate key is a minimal superkey; a primary key is the chosen candidate key. A foreign key references a candidate/unique key. A junction table represents many-to-many relationships.

A runnable pattern to study:

```sql
CREATE TABLE student_course (
  student_id BIGINT NOT NULL REFERENCES student(student_id),
  course_id BIGINT NOT NULL REFERENCES course(course_id),
  PRIMARY KEY (student_id, course_id)
);
```

Before moving on, change the sample data or predicate, predict the result, execute it, and explain the difference.

## 5. Practical example

```sql
SET search_path TO learning, public;

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE employment_status = 'ACTIVE'
ORDER BY salary DESC, employee_id;
```

This example deliberately uses an explicit column list and a tie-breaker in `ORDER BY`. Without `ORDER BY`, SQL does not promise a particular row order.

## 6. Common mistakes

- Assuming rows have an inherent order.
- Treating NULL as if it were an ordinary value.
- Using ambiguous column names in a multi-table query.
- Forgetting that joins can multiply rows.
- Making a data change without checking the target rows first.
- Assuming syntax and behaviour are identical across PostgreSQL and MySQL.

## 7. Real-world application

Think about how this concept would be used in an employee system, an online store, a banking application, or an analytics dashboard. Be able to explain not only the query, but also its assumptions and failure cases.

## 8. Practice exercises

### Easy
1. Describe the purpose of **candidate, primary, foreign, and composite keys** without using a memorized definition.
2. Run the example and explain each clause.
3. Change one condition and predict the result before running it.

### Medium
1. Adapt the example to a different table in the learning schema.
2. Include a NULL or duplicate-data edge case where relevant.
3. Explain how you would validate the result.

### Hard
1. Solve a business question using this concept and at least one other SQL concept.
2. Explain a plausible incorrect query and why it fails.
3. Discuss what could change if the underlying table grew to ten million rows.

### Expert / interview challenge
Design a production-safe approach using this concept. State assumptions, correctness risks, performance considerations, and how you would test it.

## 9. Interview questions

1. **What problem does candidate, primary, foreign, and composite keys solve?**  
   Start with the underlying data problem, then explain the SQL mechanism and a practical example.

2. **What are common mistakes?**  
   Discuss NULL behaviour, duplicate rows, implicit assumptions, and dialect differences when relevant.

3. **How would you debug an unexpected result?**  
   Reduce the query to its smallest form, inspect source rows, verify predicates and join keys, and compare intermediate results.

4. **What follow-up would an interviewer ask?**  
   Expect a request to write a query, handle an edge case, explain execution behaviour, or improve performance.

## 10. Completion checklist

- [ ] I can explain the concept without notes.
- [ ] I can write the example from memory.
- [ ] I can explain the expected result.
- [ ] I can identify at least two common mistakes.
- [ ] I completed the exercises.
- [ ] I can answer the interview questions aloud.

## Further reading

- [PostgreSQL documentation](https://www.postgresql.org/docs/current/)
- [SQL command reference](https://www.postgresql.org/docs/current/sql-commands.html)
