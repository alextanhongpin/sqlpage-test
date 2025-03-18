delete from sessions
where
	token = sqlpage.cookie ('session_token')
returning
	'cookie' as component,
	'session_token' as name,
	true as remove
;


select
	'redirect' as component,
	'index.sql' as link
;
