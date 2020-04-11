WITH tb1 AS (
    SELECT *, 
        ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) AS r,
        COUNT(*) OVER (PARTITION BY company) AS num
    FROM employee
)

SELECT id, company, salary
FROM tb1
-- when num % 2 = 0, the r of the median is num/2 and num/2 + 1
-- when num % 2 = 1, the r of the median is (num+1)/2, between num/2 and num/2 + 1
WHERE r BETWEEN num*1.0/2 AND num*1.0/2 + 1;
