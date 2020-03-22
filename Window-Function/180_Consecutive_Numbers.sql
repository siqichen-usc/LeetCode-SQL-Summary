SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num,
        LEAD(num) OVER (ORDER BY id)  AS next,
        LAG(num) OVER (ORDER BY id)  AS prev
    FROM logs
    ) tb1
WHERE num = next AND next = prev;
