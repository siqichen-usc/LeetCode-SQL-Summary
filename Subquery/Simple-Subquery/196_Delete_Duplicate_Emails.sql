DELETE FROM person
WHERE id NOT IN (
    SELECT *
    FROM (
        SELECT MIN(id) AS id
        FROM person
        GROUP BY email
        ) tb1
);
