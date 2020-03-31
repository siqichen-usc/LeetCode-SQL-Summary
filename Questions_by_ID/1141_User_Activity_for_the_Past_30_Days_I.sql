-- Solution: Basics
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
GROUP BY activity_date
HAVING activity_date BETWEEN  DATEADD(day,-29,'2019-07-27') and '2019-07-27';
