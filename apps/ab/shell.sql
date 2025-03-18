select
	'authentication' as component,
	'$argon2i$v=19$m=8,t=1,p=1$YWFhYWFhYWE$oKBq5E8XFTHO2w' as password_hash, -- this is a hash of the password 'password'
	sqlpage.basic_auth_password () as password
;


-- this is the password that the user entered in the browser popup
select
	'shell' as component,
	'A/B Experiment' as title,
	'database' as icon,
	'index.sql' as link
;
