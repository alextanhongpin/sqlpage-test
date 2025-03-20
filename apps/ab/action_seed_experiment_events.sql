with user_ids as (
	select 
		array_agg(id) as user_ids 
	from users
),
variant_ids as (
	select array_agg(id) as variant_ids
	from variants
	where experiment_id = $experiment_id::int
),
random_data as (
	select 
		(user_ids)[ceil(array_length(user_ids, 1) * random())] as user_id,
		(variant_ids)[ceil(array_length(variant_ids, 1) * random())] as variant_id,
		generate_series(1, 100)
	from user_ids, variant_ids
)
insert into experiment_events(experiment_id, user_id, variant_id, data)
select
	$experiment_id::int,
	user_id,
	variant_id,
	'{}'
from random_data
;

	
select
	'redirect' as component,
	concat('page_experiment_detail.sql?id=', $experiment_id) as link;
