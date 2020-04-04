With tb1 AS (
    SELECT employee_id
    FROM Employees
    WHERE manager_id = 1 AND employee_id != manager_id
),
tb2 AS (
    SELECT employee_id
    FROM Employees
    WHERE manager_id IN (SELECT * FROM tb1)
),
tb3 AS (
    SELECT employee_id
    FROM Employees
    WHERE manager_id IN (SELECT * FROM tb2)
)

SELECT *
FROM tb1
UNION
SELECT *
FROM tb2
UNION
SELECT *
FROM tb3;
