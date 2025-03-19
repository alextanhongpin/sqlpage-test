SELECT 'dynamic' AS component, sqlpage.run_sql('apps/ab/shell.sql') AS properties;

set experiment = (select json_build_object(
		'id', id,
		'name', name,
		'description', description,
		'active', active,
		'start_date', lower(period),
		'end_date', upper(period)
) from experiments where id = $id::int);


select 
    'datagrid' as component;
select 
    'ID' as title,
    $experiment::jsonb->>'id' as description;
select 
    'Name' as title,
    $experiment::jsonb->>'name' as description;
select 
    'Description' as title,
    $experiment::jsonb->>'description' as description;
select 
    'Active' as title,
    $experiment::jsonb->>'active' as description;
select 
    'Start Date' as title,
    $experiment::jsonb->>'start_date' as description;
select 
    'End Date' as title,
    $experiment::jsonb->>'end_date' as description;

select
    'button' as component
    ;

select
    'Create Variant' as title,
    'primary' as color,
    concat('page_create_variant.sql?experiment_id=', $experiment::jsonb->>'id') as link
    ;

select 
    'table' as component,
    'No variants' as empty_description,
    true as search,
    true as sort,
    true as striped_rows,
    'data' as markdown,
    'delete' as markdown,
    'edit' as markdown,
    'view' as markdown
    ;


select *,
    concat('[Delete](action_delete_variant.sql?id=', id, '&experiment_id=', $id, ')') as delete,
    concat('[Edit](page_update_variant.sql?id=', id, ')') as edit
from variants
order by id desc
limit 100;
