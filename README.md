# sqlpage-test

https://learnsqlpage.com/sqlpage_quickstart.html

## Setting row as variable

```sql
-- Set a row as a variable.
set experiment = (select row_to_json(experiments) from experiments limit 1);

-- Access individual fields.
set id = $experiment::jsonb->>'id';


select 
    'text' as component,
    $experiment as title,
    $id as contents_md
    ;
```

## Conditional rendering

```sql
set active = true;

select 
    'text' as component;
select 
case when $active::boolean then
    (select 'hallo' as contents_md)
else
    (select 'hwat' as contents_md)
end;
```
