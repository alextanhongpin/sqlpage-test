-- If user is already logged in, redirect user back to home page.
select
	'form' as component,
	'Login' as title,
	'Log in' as validate,
	'action_create_session.sql' as action
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
