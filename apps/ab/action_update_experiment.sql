update experiments set
	name = $name,
	description = $description,
	active = coalesce($active, '') = 'active', -- use '=', not '=='
	period = case
		when $start_date == '' and $end_date == '' 
			then '[,)'
		else tstzrange($start_date::timestamptz, $end_date::timestamptz, '[)')
	end
where id = $id::int
returning
	'redirect' as component, 
	'index.sql' as link
	;
