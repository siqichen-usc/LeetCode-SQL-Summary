WITH tb1 AS (
    SELECT u1.username, u1.activity, u1.startDate, u1.endDate, COUNT(*) AS r
    FROM UserActivity u1
    JOIN UserActivity u2
    ON u1.username = u2.username AND u1.endDate <= u2.endDate
    GROUP BY u1.username, u1.activity, u1.startDate, u1.endDate
),
tb2 AS (
    SELECT username, COUNT(*) AS c
    FROM UserActivity
    GROUP BY username
)

SELECT tb1.username, tb1.activity, tb1.startDate, tb1.endDate
FROM tb1
JOIN tb2
ON tb1.username = tb2.username
WHERE tb1.r = 2 OR tb2.c = 1;
