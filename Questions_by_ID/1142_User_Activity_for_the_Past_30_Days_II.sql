-- Solution 1: IIF
SELECT CAST(
    COUNT(DISTINCT session_id)*1.0
    /
    IIF(COUNT(DISTINCT user_id) > 0,COUNT(DISTINCT user_id) ,1)
    AS DECIMAL(10,2)
    ) AS average_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN DATEADD(day,-29,'2019-07-27') and '2019-07-27';



-- Solution 2: Subquery
WITH tb1 AS(
    SELECT COUNT(DISTINCT session_id) AS num
    FROM activity
    WHERE activity_date BETWEEN DATEADD(day,-29,'2019-07-27') and '2019-07-27'
    GROUP BY user_id
)

SELECT CAST(
    ISNULL(AVG(num*1.0),0)
    AS DECIMAL(10,2)
) AS average_sessions_per_user
FROM tb1;
