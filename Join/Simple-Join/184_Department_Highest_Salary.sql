WITH max_salary AS (
    SELECT departmentid, max(salary) AS max_salary
    FROM employee
    GROUP BY departmentid
)

SELECT d.name department, e.name employee, e.salary
FROM max_salary ms
JOIN employee e
    ON ms.departmentid = e.departmentid AND ms.max_salary = e.salary
JOIN department d
  ON e.departmentid = d.id;
