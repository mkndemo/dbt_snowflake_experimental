## example code to use for the incremental updates

### Update customer in db2.customers
``` sql
INSERT INTO 
    raw.db2 (id, first_name, last_name, updated_at) 
    VALUES (3, 'Rob', 'Brown', '2023-10-04 10:00:00');
```

### Update customer in db2.customers
```sql
UPDATE raw.db2 
    set first_name = 'Max', updated_at = '2024-09-26 10:00' 
    where id = 3
```


