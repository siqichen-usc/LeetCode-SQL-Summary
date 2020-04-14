-- Solution: Subquery, Join
-- find the number of approved transactions and their total amount for each month and country 
WITH tb1 AS (
    SELECT LEFT(trans_date,7) AS month, country,
        COUNT(state) AS approved_count,
        SUM(amount) AS approved_amount
    FROM Transactions
    WHERE state = 'approved'
    GROUP BY LEFT(trans_date,7), country
),
-- find the number of chargebacks and their total amount for each month and country
tb2 AS (
    SELECT LEFT(c.trans_date,7) AS month, country,
        COUNT(c.trans_id) AS chargeback_count,
        SUM(t.amount) AS chargeback_amount
    FROM Chargebacks c
    JOIN Transactions t
    ON c.trans_id = t.id
    GROUP BY LEFT(c.trans_date,7), country
)

-- when there is no approved transactions or chargebacks for a country in a certain month,
-- replace the NULL with 0
SELECT COALESCE(tb1.month,tb2.month) AS month,
     COALESCE(tb1.country,tb2.country) AS country,
     ISNULL(tb1.approved_count,0) AS approved_count,
     ISNULL(tb1.approved_amount,0) AS approved_amount,
     ISNULL(tb2.chargeback_count,0) AS chargeback_count,
     ISNULL(tb2.chargeback_amount,0) AS chargeback_amount
FROM tb1
FULL OUTER JOIN tb2
ON tb1.month = tb2.month AND tb1.country = tb2.country;
