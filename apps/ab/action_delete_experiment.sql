delete from experiments
where id = $id::int
returning
	'redirect' as component, 
	'index.sql' as link
	;
