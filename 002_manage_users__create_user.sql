INSERT INTO users(name) VALUES(:username)
RETURNING 'redirect' AS component, '002_manage_users.sql' AS link;
