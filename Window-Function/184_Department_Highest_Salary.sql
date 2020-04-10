SELECT department, employee, salary
FROM (
    SELECT d.name department, e.name employee ,salary,
        -- ranking salaries in each department
        -- the employee with highest salary will get r = 1
        DENSE_RANK() OVER (
            PARTITION BY departmentid 
            ORDER BY salary DESC) r
    FROM employee e
    JOIN department d
        ON e.departmentid = d.id
    ) AS tb1
WHERE r = 1;
