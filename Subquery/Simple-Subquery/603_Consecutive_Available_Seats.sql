-- Soltuion 1: Window Function, Subquery
WITH tb1 AS (
    SELECT seat_id, row_number() OVER (ORDER BY seat_id) AS r
    FROM cinema
    WHERE free = 1
),
tb2 AS (
    SELECT seat_id, COUNT(*) OVER (PARTITION BY (seat_id - r)) AS num
    FROM tb1
)

SELECT seat_id
FROM tb2
WHERE num >= 2;



-- Soltuion 2: Window Function, Subquery
WITH tb1 AS (
    SELECT seat_id, free AS free1,
        LEAD(free) OVER (ORDER BY seat_id) AS free2,
        LAG(free) OVER (ORDER BY seat_id) AS free0
    FROM cinema
)

SELECT seat_id
FROM tb1
WHERE free1 = 1 AND (free2 = 1 OR free0 = 1);
