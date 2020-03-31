-- You could update the variable to any date you want or GETDATE(), and then same analysis will be done for the new date 

-- Using ROW_NUMBER() instead of RANK() or DENSE_RANK() 
-- to avoid return several rows when user login more than once at the first date

DECLARE @d date;
SET @d = DATEADD(DAY,-90, '2019-06-30');

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
HAVING activity_date >= @d;
