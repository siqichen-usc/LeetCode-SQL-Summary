SELECT MIN(next-x) AS shortest
FROM (
    SELECT x, LEAD(x) OVER (ORDER BY x) AS next
    FROM point
) tb1;
