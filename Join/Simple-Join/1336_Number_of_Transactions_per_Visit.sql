WITH tb1 AS (
    SELECT v.user_id, v.visit_date, COUNT(t.transaction_date) AS c
    FROM Visits v
    LEFT JOIN Transactions t
    ON v.visit_date = t.transaction_date AND v.user_id = t.user_id
    GROUP BY v.user_id, v.visit_date
),
cte AS (
    SELECT MAX(c) AS c
    FROM tb1
    UNION ALL
    SELECT c-1
    FROM cte
    WHERE c > 0
)

SELECT cte.c AS transactions_count,
    COUNT(tb1.user_id) AS visits_count
FROM cte
LEFT JOIN tb1
ON cte.c = tb1.c
GROUP BY cte.c
ORDER BY transactions_count;
