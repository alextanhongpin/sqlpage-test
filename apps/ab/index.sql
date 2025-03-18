create table if not exists experiments (
    id int generated always as identity,
    name text not null,
    description text not null,
    active boolean not null default false,
    period tstzrange not null default '[,)',
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    
    primary key (id),
    unique (name)
);

create table if not exists variants (
	id int generated always as identity,
	name text not null,
	description text not null,
	data jsonb not null,
	experiment_id int not null,
	percentage int not null,
	
	primary key (id),
	unique (experiment_id, name),
	foreign key(experiment_id) references experiments(id)
);

create table if not exists experiment_events (
	id int generated always as identity,

	experiment_id int not null,
	variant_id int not null,
	user_id int not null,
	data jsonb not null,
	
	primary key (id),
	foreign key (experiment_id) references experiments(id),
	foreign key (variant_id) references variants(id)
);


select
    'text' as component,
    'A/B Experiment' as title,
    'View and create new experiment and variants for your A/B test' as contents_md
    ; 


select
    'button' as component;
select
    'Create a new experiment' as title,
    'page_create_experiment.sql' as link
    ;


select 
    'table' as component,
    'Create a new experiment' as empty_description,
    true as search,
    true as sort,
    true as striped_rows,
    'delete' as markdown,
    'edit' as markdown
    ;


select *,
    concat('[Delete](action_delete_experiment.sql?id=', id, ')') as delete,
    concat('[Edit](page_update_experiment.sql?id=', id, ')') as edit
from experiments
order by id desc
limit 100;
