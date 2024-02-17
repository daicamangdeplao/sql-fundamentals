# Aggregation

Aggregate functions perform a calculation on a set of rows and return a single row. PostgreSQL provides all standard SQL’s aggregate functions as follows:

* ``AVG()`` – return the average value.
* ``COUNT()`` – return the number of values.
* ``MAX()`` – return the maximum value.
* ``MIN()`` – return the minimum value.
* ``SUM()`` – return the sum of all or distinct values.

We often use the aggregate functions with the ``GROUP BY`` clause in the ``SELECT`` statement. In these cases, the ``GROUP BY`` clause divides the result set into groups of rows and the aggregate functions perform a calculation on each group e.g., maximum, minimum, average, etc.

You can use aggregate functions as expressions only in the following clauses:

* ``SELECT`` clause.
* ``HAVING`` clause.
