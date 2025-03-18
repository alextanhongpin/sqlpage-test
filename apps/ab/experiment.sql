SELECT 'dynamic' AS component, sqlpage.run_sql('apps/ab/shell.sql') AS properties;

set experiment = (select json_build_object(
		'id', id,
		'name', name,
		'description', description,
		'active', active,
		'start_date', lower(period),
		'end_date', upper(period)
) from experiments where id = $id::int);


select
	'text' as component,
	$experiment as contents_md;

select 
    'table' as component,
    'No variants' as empty_description,
    true as search,
    true as sort,
    true as striped_rows,
    'delete' as markdown,
    'edit' as markdown,
    'view' as markdown
    ;


select *,
    concat('[Delete](action_delete_experiment.sql?id=', id, ')') as delete,
    concat('[Edit](page_update_experiment.sql?id=', id, ')') as edit,
    concat('[View](experiment.sql?id=', id, ')') as view
from variants
order by id desc
limit 100;
