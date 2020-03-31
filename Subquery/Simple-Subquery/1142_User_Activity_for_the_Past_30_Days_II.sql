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
