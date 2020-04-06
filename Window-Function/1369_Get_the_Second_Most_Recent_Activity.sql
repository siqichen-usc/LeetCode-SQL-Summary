SELECT username, activity, startDate, endDate
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY username ORDER BY endDate DESC) AS r,
        COUNT(*) OVER (PARTITION BY username) AS c
    FROM UserActivity
) tb1
WHERE r = 2 OR c = 1;
