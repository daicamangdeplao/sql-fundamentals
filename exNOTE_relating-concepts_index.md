# Relating Concetps - Index

## Index

* Without index, the data stored in the table will be queried sequentially. By adopting index, the data is organized in a particular order that helpsto speed up various searches. This is why indexes come into play.
* Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.

```postgresql
CREATE INDEX index_name ON table_name(column_a, column_b, ...)
```

Let's take a look on the database [``dvd_rental``](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/), do the query on the table of ``customer``

```postgresql
EXPLAIN
SELECT first_name, last_name
FROM customer
WHERE first_name = 'Tamara';
```

The total computation cost for this query is **16.49**.

Now, the index for first name is introduced

```postgresql
CREATE INDEX idx_first_name ON customer(first_name);
```

Then we do the same query as before, the total computational cost is **8.29**.

## References

1. [PostgreSQL CREATE INDEX](https://www.postgresqltutorial.com/postgresql-indexes/postgresql-create-index/)
2. [SQL CREATE INDEX Statement](https://www.w3schools.com/sql/sql_create_index.asp)
3. [How to read PostgreSQL query plan](https://medium.com/geekculture/how-to-read-postgresql-query-plan-df4b158781a1)
