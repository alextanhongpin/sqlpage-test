update variants set
	name = coalesce($name, name),
	description = coalesce($description, description),
	data = coalesce($data::jsonb, data),
	experiment_id = coalesce($experiment_id::int, experiment_id),
	percentage = coalesce($percentage::int, percentage)
where id = $id::int
returning
	'redirect' as component, 
	concat('page_experiment_detail.sql?id=', $experiment_id) as link
	;
