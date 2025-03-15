-- create table users (
--     id int generated always as identity primary key,
--     name text not null
-- )
INSERT INTO users(name) VALUES(:username)
RETURNING 'redirect' AS component, '002_manage_users.sql' AS link;
