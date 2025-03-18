create table if not exists users (
	id int generated always as identity primary key,
	name text not null
)
;


select
	'form' as component,
	'002_manage_users__create_user.sql' as action
;


select
	'username' as name
;


select
	'table' as component,
	'Users' as title,
	'List of users' as description,
	'No users found' as empty_description,
	true as sort,
	true as search,
	'Actions' as markdown
;


-- Set to true to enable markdown in the column.
select
	id as id,
	name as description,
	'[Delete](002_manage_users__delete_user.sql?delete=' || id || ')' as Actions
from
	users
limit
	10
;
