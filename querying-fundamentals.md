# Querying Fundamentals

From the programmer’s and the system’s point of view regarding query optimization, it is generally preferable to write **a query with as little nesting and implied ordering as possible**.

The six query clauses are specified in the following order, with the clauses between square brackets ``[...]`` being optional

``` sql
1. SELECT <attribute and function list>
2. FROM <table list>
3. [ WHERE <condition> ]
4. [ GROUP BY <grouping attribute(s)> ]
5. [ HAVING <group condition> ]
6. [ ORDER BY <attribute list> ];
```
