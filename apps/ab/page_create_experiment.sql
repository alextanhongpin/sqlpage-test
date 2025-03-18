SELECT 'dynamic' AS component, sqlpage.run_sql('apps/ab/shell.sql') AS properties;

select
	'form' as component,
	'Create Experiment' as title,
	'action_create_experiment.sql' as action;

select 
	'name' as name,
	'Name' as label,
	'Enter name' as placeholder,
	true as required
	;

select 
	'description' as name,
	'Description' as label,
	'Enter description' as placeholder,
	true as required
	;

select 
	'active' as name,
	'Active' as label,
	'checkbox' as type,
	'active' as value -- This will only be send if 'checked' is true
	;

select 
    'start_date' as name,
    'Start Date' as label,
    'date'       as type
		;

select 
		'end_date' as name,
		'End Date' as label,
    'date'       as type
		;
