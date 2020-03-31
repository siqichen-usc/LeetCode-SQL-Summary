WITH tb1 AS (
    SELECT *,
        AVG(occurences*1.0) OVER (PARTITION BY event_type) AS avg_oc
    FROM Events
)

SELECT business_id
FROM tb1
GROUP BY business_id
HAVING SUM(CASE WHEN occurences > avg_oc THEN 1 ELSE 0 END) > 1;
