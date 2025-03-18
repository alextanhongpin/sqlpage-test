insert into
	users (name)
values
	(:username)
returning
	'redirect' as component,
	'002_manage_users.sql' as link
;
