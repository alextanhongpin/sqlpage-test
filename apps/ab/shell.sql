-- Check if the user is logged in, otherwise redirect user back to login page.
select
	'redirect' as component,
	'page_login.sql' as link
where
	(
		select
			not exists (
				select
					1
				from
					sessions
				where
					token = sqlpage.cookie ('session_token')
			)
	)
;


select
	'shell' as component,
	'A/B Experiment' as title,
	'database' as icon,
	'index.sql' as link,
	JSON('{"title":"Logout","link": "action_logout.sql"}') as menu_item
;
