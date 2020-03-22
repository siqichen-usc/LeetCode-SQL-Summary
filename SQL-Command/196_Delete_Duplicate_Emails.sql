-- Solution 1: SQL Command, Join
DELETE p1 
FROM person p1
JOIN person p2
    ON p1.email = p2.email AND p1.id > p2.id;  
    


-- Solution 2: SQL Command, Subquery
DELETE FROM person
WHERE id NOT IN (
    SELECT *
    FROM (
        SELECT MIN(id) AS id
        FROM person
        GROUP BY email
        ) tb1
);
