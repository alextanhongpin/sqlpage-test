set has_events = (select count(*) from experiment_events where variant_id = $id::int);

select
	'alert' as component,
	'Warning' as title,
  'alert-triangle'    as icon,
	true as important,
	'There are some events associated with the variant? Delete the events before deleting the variant?' as description,
	'yellow' as color
where $has_events::int > 0;

select
	'Yes' as title,
	'red' as color,
	concat('action_delete_variant_and_events.sql?id=', $id::int, '&experiment_id=', $experiment_id) as link
where $has_events::int > 0;
	;

select
	'Back to experiment' as title,
	'secondary' as color,
	concat('page_experiment_detail.sql?id=', $experiment_id) as link
where $has_events::int > 0;

delete from variants
where id = $id::int
and $has_events::int = 0
returning
	'redirect' as component, 
	concat('page_experiment_detail.sql?id=', $experiment_id) as link
	;
