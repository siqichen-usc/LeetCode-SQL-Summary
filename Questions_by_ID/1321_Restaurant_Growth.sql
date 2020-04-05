-- Solution 1: Window Function, OFFSET FETCH
SELECT visited_on, 
    SUM(SUM(amount)) OVER (
        ORDER BY visited_on 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    CAST(
        SUM(SUM(amount)) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        )/7.0
        AS  DECIMAL(10,2)
    )  AS average_amount
FROM Customer
GROUP BY visited_on
ORDER BY visited_on
OFFSET 6 ROWS;



-- Solution 2: Subquery, Join
WITH total AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)

SELECT t1.visited_on, 
    SUM(t2.amount) AS amount,
    CAST(AVG(t2.amount*1.0) AS DECIMAL(10,2)) AS average_amount
FROM total t1
JOIN total t2
ON t1.visited_on >= t2.visited_on AND t1.visited_on <= DATEADD(day,6,t2.visited_on)
GROUP BY t1.visited_on
HAVING COUNT(t2.visited_on) = 7
ORDER BY t1.visited_on;
