SELECT 'dynamic' AS component, sqlpage.run_sql('apps/ab/shell.sql') AS properties;

select
	'form' as component,
	'Create Variant' as title,
	'Create' as validate,
	'action_create_variant.sql' as action
;


select
	'name' as name,
	'Name' as label,
	'Enter variant' as placeholder,
	true as required
;


select
	'description' as name,
	'Description' as label,
	'Enter description' as placeholder,
	true as required
;


select
	'textarea' as type,
	'data' as name,
	'Data' as label,
	'Enter data' as placeholder,
	true as required
;

select
	'hidden' as type,
	'experiment_id' as name,
	$experiment_id as value,
	true as required
;

select
	'number' as type,
	'percentage' as name,
	0 as min,
	100 as max,
	true as required
;
