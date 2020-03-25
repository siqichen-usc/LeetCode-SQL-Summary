WITH tb1 AS (
    SELECT e1.id, e1.company, e1.salary, COUNT(*) AS r, 
        (SELECT COUNT(*) FROM employee WHERE company = e1.company) AS num
    FROM employee e1
    JOIN employee e2
    ON e1.company = e2.company 
        AND (e1.salary > e2.salary OR (e1.salary = e2.salary AND e1.id >= e2.id))
    GROUP BY e1.id, e1.company, e1.salary
)

SELECT id, company, salary
FROM tb1
WHERE r BETWEEN num*1.0/2 AND num*1.0/2 + 1;
