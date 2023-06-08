# Relating Concetps

## Data Integrity

**Data integrity** refers to the **correctness** and **completeness** of data within a database. To enforce data integrity, you can constrain or restrict the data values that users can insert, delete, or update in the database. For example, the integrity of data in the pubs2 and pubs3 databases requires that a book title in the titles table must have a publisher in the publishers table. You cannot insert books that do not have a valid publisher into titles, because it violates the data integrity of pubs2 or pubs3.

## References

1. [Understanding PostgreSQL Data Integrity](https://www.dbvis.com/thetable/understanding-postgresql-data-integrity/)