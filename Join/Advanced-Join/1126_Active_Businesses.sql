-- Solution 1: Window Function, Subquery, CASE WHEN
WITH tb1 AS (
    SELECT *,
        AVG(occurences*1.0) OVER (PARTITION BY event_type) AS avg_oc
    FROM Events
)

SELECT business_id
FROM tb1
GROUP BY business_id
HAVING SUM(CASE WHEN occurences > avg_oc THEN 1 ELSE 0 END) > 1;



-- Solution 2: Subquery, Join
WITH tb1 AS (
    SELECT event_type, AVG(occurences*1.0) AS avg_oc
    FROM Events
    GROUP BY event_type
)

SELECT business_id
FROM Events e
JOIN tb1
ON e.event_type = tb1.event_type AND e.occurences > tb1.avg_oc
GROUP BY business_id
HAVING COUNT(*) > 1;
