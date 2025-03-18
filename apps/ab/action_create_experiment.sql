insert into experiments(
	name,
	description,
	active,
	period
) values (
	$name,
	$description,
	$active = 'active', -- use '=', not '=='
	case
		when $start_date == '' and $end_date == '' 
			then '[,)'
		else tstzrange($start_date::timestamptz, $end_date::timestamptz, '[)')
	end
)
returning
	'redirect' as component, 
	'index.sql' as link
	;
