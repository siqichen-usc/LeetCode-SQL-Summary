-- Solution 1: Subquery, Join
SELECT CAST(
    -- using DISTINCT to avoid double counting
    COUNT(DISTINCT a2.player_id)*1.0/COUNT(DISTINCT a1.player_id)
    AS DECIMAL(3,2)
) AS fraction
FROM (
    -- get the first-logged-in date of each player
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY player_id
) a1
-- if a player logged back in on the day right after the first-logged-in date, 
-- he/she would get a matched record from table a2
LEFT JOIN Activity a2
ON a1.player_id = a2.player_id AND DATEADD(day,1,a1.event_date) = a2.event_date;
    
 
 
-- Solution 2: Subquery, Window Function
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
