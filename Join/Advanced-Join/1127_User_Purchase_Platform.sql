WITH tb1 AS (
    SELECT user_id,spend_date,amount,
        CASE 
            WHEN COUNT(*) OVER (PARTITION BY user_id, spend_date) = 1 THEN platform
            ELSE 'both'
        END AS platform
    FROM Spending
),
tb2 AS (
    SELECT spend_date, platform,
        SUM(amount) AS total_amount, 
        COUNT(DISTINCT user_id) AS total_users
    FROM tb1
    GROUP BY spend_date, platform
),
d AS (
    SELECT DISTINCT spend_date
    FROM tb2
),
p AS (
    SELECT 'desktop' AS platform
    UNION
    SELECT 'mobile'
    UNION
    SELECT 'both'
)

SELECT d.spend_date, p.platform, 
        ISNULL(total_amount,0) AS total_amount, 
        ISNULL(total_users,0) AS total_users
FROM d
CROSS JOIN p
LEFT JOIN tb2
ON d.spend_date = tb2.spend_date and p.platform = tb2.platform;
