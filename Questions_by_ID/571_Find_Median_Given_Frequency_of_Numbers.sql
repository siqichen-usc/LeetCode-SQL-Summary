-- Solution: Window Function, Subquery
WITH tb1 AS (
    SELECT *, 
        SUM(frequency) OVER (ORDER BY number) AS cum_num,
        SUM(frequency) OVER () AS num
    FROM numbers
)

SELECT AVG(number*1.0) AS median
FROM tb1
WHERE num / 2.0 BETWEEN cum_num - frequency AND cum_num;
