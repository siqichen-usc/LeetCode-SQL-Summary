SELECT department, employee, salary
FROM (
    SELECT d.name AS department, e.name AS employee, salary,
        DENSE_RANK() OVER (
            PARTITION BY departmentid
            ORDER BY salary DESC
        ) AS r
    FROM employee e
    JOIN department d
        ON e.departmentid = d.id
    ) AS tb1
WHERE r <= 3
