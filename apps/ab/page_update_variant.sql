SELECT 'dynamic' AS component, sqlpage.run_sql('apps/ab/shell.sql') AS properties;

set variant = (select row_to_json(variants) from variants where id = $id::int);

select
	'form' as component,
	'Update Variant' as title,
	'Update' as validate,
	'action_update_variant.sql' as action
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

select
	'hidden' as type,
	'experiment_id' as name,
	true as required,
	$variant::jsonb->>'experiment_id' as value
;



select
	'number' as type,
	'percentage' as name,
	0 as min,
	100 as max,
	true as required,
	$variant::jsonb->>'percentage' as value
;
