-- Solution: Basics
SELECT MAX(num) AS num
FROM (
    SELECT num 
    FROM my_numbers 
    GROUP BY num 
    HAVING COUNT(*) = 1
) tb1;
