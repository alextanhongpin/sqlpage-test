set user = (
    select row_to_json(users)
    from users
    where username = :username
);

select
    'authentication' as component,
    'page_login.sql' as link,
    $user::jsonb->>'password_hash' as password_hash, 
    :password as password
    ;


insert into sessions (token, user_id)
values (sqlpage.random_string(32), $user::jsonb->>'id')
returning
    'cookie' as component,
    'session_token' as name,
    id as value;

select 
    'redirect' as component,
    'index.sql' as link
    ;
