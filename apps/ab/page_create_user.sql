select
	'form' as component,
	'Create User' as title,
	'Create' as validate,
	'action_create_user.sql' as action
;


select
	'username' as name,
	'Username' as label,
	'admin' as placeholder,
	true as required
;


select
	'password' as type,
	'password' as name,
	'Password' as label,
	true as required
;
