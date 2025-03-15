DELETE FROM users 
WHERE id = CAST($delete AS INT)
RETURNING 'redirect' AS component, '002_manage_users.sql' AS link;
