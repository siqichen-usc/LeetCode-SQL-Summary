WITH tb1 AS (
    SELECT *, 
        -- There are cum_num numbers in TABLE numbers less than or equal to number in that record
        -- e.g. There are cum_num = 8 numbers in TABLE numbers less than or equal to 1
        -- so you will see [1,1,8,12] AS [Number, Frequency, cum_num, num]
        SUM(frequency) OVER (ORDER BY number) AS cum_num,
        SUM(frequency) OVER () AS num
    FROM numbers
)

SELECT AVG(number*1.0) AS median
FROM tb1
WHERE num / 2.0 BETWEEN cum_num - frequency AND cum_num;
