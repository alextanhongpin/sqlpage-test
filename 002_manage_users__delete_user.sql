delete from users
where
	id = CAST($delete as INT) RETURNING 'redirect' as component,
	'002_manage_users.sql' as link
;
