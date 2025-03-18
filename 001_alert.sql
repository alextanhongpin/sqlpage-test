select
	'alert' as component,
	'Success' as title,
	'Item successfully added to your cart.' as description,
	'check' as icon,
	'green' as color
;


select
	'alert' as component,
	'Warning' as title,
	'Your cart is almost full.' as description,
	'alert-triangle' as icon,
	'yellow' as color
;


select
	'alert' as component,
	'Error' as title,
	'Your cart is full.' as description,
	'alert-circle' as icon,
	'red' as color
;


-- Notification.
select
	'alert' as component,
	'Your dashboard is ready!' as title,
	'analyze' as icon,
	'teal' as color,
	true as dismissible,
	'Your public web dashboard was successfully created.' as description
;


select
	'dashboard.sql' as link,
	'View your dashboard' as title
;


select
	'index.sql' as link,
	'Back to home' as title,
	'secondary' as color
;
