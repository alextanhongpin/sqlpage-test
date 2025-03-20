delete from experiment_events
where variant_id = $id::int;

delete from variants
where id = $id::int
returning
	'redirect' as component, 
	concat('page_experiment_detail.sql?id=', $experiment_id) as link
	;
