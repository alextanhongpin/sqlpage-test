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


-- Table: Start
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
    concat('[Edit](?edit=', id, '&id=', experiment_id,')') as edit
from variants
order by id desc
limit 100;
-- Table: End


-- Form: Start
set variant = (select row_to_json(variants) from variants where id = $edit::int);

select
	'form' as component,
  case when $edit is not null then 'Update Variant' else 'Create Variant' end as title,
  case when $edit is not null then 'Update' else 'Create' end as validate,
  case when $edit is not null then 'action_update_variant.sql' else 'action_create_variant.sql' end as action
;

select 
	'id' as name,
	'hidden' as type,
	$variant::jsonb->>'id' as value
	;


select
	'name' as name,
	'Name' as label,
	'Enter variant' as placeholder,
	true as required,
	$variant::jsonb->>'name' as value
;


select
	'description' as name,
	'Description' as label,
	'Enter description' as placeholder,
	true as required,
	$variant::jsonb->>'description' as value
;


select
	'textarea' as type,
	'data' as name,
	'Data' as label,
	'Enter data' as placeholder,
	true as required,
	$variant::jsonb->>'data' as value
;
;

select
	'hidden' as type,
	'experiment_id' as name,
	$id as value,
	true as required
;

select
	'number' as type,
	'percentage' as name,
	0 as min,
	100 as max,
	true as required,
	$variant::jsonb->>'percentage' as value
;

select
    'button' as component
    ;

-- Form: End

-- Seed: Start
select
    'button' as component
    ;
select
    'Seed Experiment Events' as title,
    concat('action_seed_experiment_events.sql?experiment_id=', $id) as link 
    ;
-- Seed: End


-- Chart: Start
select 
    'chart'   as component,
    'Events'  as title,
    'pie'     as type,
    TRUE      as labels;
select
    v.name as label, 
    count(*) as value
from experiment_events ee
join variants v on (v.id = ee.variant_id)
where ee.experiment_id = $id::int
group by v.experiment_id, v.name;
-- Chart: End
