insert into variants(
    name,
    description,
    data,
    experiment_id,
    percentage
) values (
    $name,
    $description,
    $data::jsonb,
    $experiment_id::int,
    $percentage::int
) returning
    'redirect' as component,
    concat('page_experiment_detail.sql?id=', $experiment_id) as link;

