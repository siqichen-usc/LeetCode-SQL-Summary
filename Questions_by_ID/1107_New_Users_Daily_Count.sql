-- Solution 1: Subquery
WITH tb1 AS (
    SELECT user_id, MIN(activity_date) AS login_date
    FROM traffic
    WHERE activity = 'login'
    GROUP BY user_id)
    
SELECT login_date, COUNT(*) AS user_count
FROM tb1
GROUP BY login_date
HAVING login_date >= DATEADD(DAY,-90, '2019-06-30');



-- Solution 2: Window Function, Subquery

-- Using ROW_NUMBER() instead of RANK() or DENSE_RANK() 
-- to avoid return several rows when user login more than once at the first date

WITH tb1 AS (
    SELECT *, 
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY activity_date) AS r
    FROM Traffic
    WHERE activity = 'login'
)

SELECT activity_date AS login_date, COUNT(*) AS user_count
FROM tb1
WHERE r = 1
GROUP BY activity_date
HAVING activity_date >= DATEADD(DAY,-90, '2019-06-30');
