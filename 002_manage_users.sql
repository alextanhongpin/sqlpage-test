SELECT 
    'form'            AS component,
    '002_manage_users__create_user.sql' AS action;
SELECT 
    'username' AS name;


SELECT 'list' AS component,
    'Users' AS title,
    'List of users' AS description,
    false AS compact;

SELECT
    id AS id,
    name AS description,
    '002_manage_users__delete_user.sql?delete=' || id AS delete_link
FROM users
LIMIT 10;
