WITH tb2 as (
    SELECT player_id 
    FROM (
        SELECT player_id, 
            -- the first-logged-in date
            MIN(event_date) OVER (PARTITION BY player_id) AS event_date,
            -- the next-logged-in date after first-logged-in date
            LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS lead_date
        FROM activity
        ) tb1
    -- only keep users the next-logged-in date after first-logged-in date is the day after first-logged in date
    WHERE dateadd(day,1, event_date) = lead_date
)

SELECT CAST(
    COUNT(DISTINCT player_id)*1.0/(SELECT COUNT(DISTINCT player_id) FROM activity)
    AS DECIMAL(3,2)
    ) AS fraction
FROM tb2;
