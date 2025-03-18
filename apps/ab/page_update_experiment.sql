-- set experiment = (select row_to_json(experiments) from experiments where id = $id::int);
set experiment = (select json_build_object(
		'id', id,
		'name', name,
		'description', description,
		'active', active,
		'start_date', lower(period),
		'end_date', upper(period)
) from experiments where id = $id::int);

select
	'form' as component,
	'action_update_experiment.sql' as action
	;

select 
	'id' as name,
	'hidden' as type,
	$experiment::jsonb->>'id' as value
	;

select 
	'name' as name,
	'Name' as label,
	'Enter name' as placeholder,
	true as required,
	$experiment::jsonb->>'name' as value
	;

select 
	'description' as name,
	'Description' as label,
	'Enter description' as placeholder,
	true as required,
	$experiment::jsonb->>'description' as value
	;

select 
	'active' as name,
	'Active' as label,
	'checkbox' as type,
	$experiment::jsonb->'active' as checked,
	'active' as value -- This will only be send if 'checked' is true
	;

select 
    'start_date' as name,
    'Start Date' as label,
    'date'       as type,
		$experiment::jsonb->>'start_date' as value
		;

select 
		'end_date' as name,
		'End Date' as label,
    'date'       as type,
		$experiment::jsonb->>'end_date' as value
		;
