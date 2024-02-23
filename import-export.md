# Import/Export Data

## JSON

without using ``json_agg`` function, new-line-character will be shown in exported file.

``` sql
COPY (
    SELECT json_agg(row_to_json(t))
    FROM (
             SELECT *
             FROM my_table
             WHERE column_foo = 'value-foo'
         ) t
    )
TO 'C:\path\to\json\file\my_table.json';
```

## Reference

* <https://dba.stackexchange.com/a/318999>
* <https://stackoverflow.com/questions/39224382/how-can-i-import-a-json-file-into-postgresql>
* <https://konbert.com/blog/import-json-into-postgres-using-copy>
