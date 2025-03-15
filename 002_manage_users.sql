CREATE TABLE IF NOT EXISTS users (
    id int generated always as identity primary key,
    name text not null
);

SELECT 
    'form'            AS component,
    '002_manage_users__create_user.sql' AS action;
SELECT 
    'username' AS name;


SELECT 'table' AS component,
    'Users' AS title,
    'List of users' AS description,
    'No users found' AS empty_description,
    true AS sort,
    true AS search,
    'Actions' AS markdown; -- Set to true to enable markdown in the column.

SELECT
    id AS id,
    name AS description,
    '[Delete](002_manage_users__delete_user.sql?delete=' || id || ')' AS Actions
FROM users
LIMIT 10;
