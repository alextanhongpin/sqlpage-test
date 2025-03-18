insert into users(
	username,
	password_hash
) values (
	$username,
	sqlpage.hash_password($password)
);

select 
    'alert'   as component,
    'Success' as title,
    'User created' as description,
    'check'   as icon,
    'green'   as color;
