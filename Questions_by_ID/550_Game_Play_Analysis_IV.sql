-- Solution 1: Subquery, Join, Window Function
SELECT CAST(
    COUNT(DISTINCT a.player_id)*1.0/COUNT(DISTINCT tb1.player_id)
    AS DECIMAL(10,2)
    ) AS fraction
FROM (
    SELECT player_id, event_date, 
        DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS r
    FROM activity) tb1
LEFT JOIN activity a
ON tb1.r = 1 AND tb1.player_id = a.player_id 
    AND dateadd(day,1, tb1.event_date) = a.event_date;
    
 
 
-- Solution 2: Subquery, Window Function
WITH tb2 as (
SELECT player_id 
FROM (
    SELECT player_id, 
        MIN(event_date) OVER (PARTITION BY player_id) AS event_date,
        LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS lead_date
    FROM activity
    ) tb1
WHERE dateadd(day,1, event_date) = lead_date
)

SELECT CAST(
    COUNT(DISTINCT player_id)*1.0/(SELECT COUNT(DISTINCT player_id) FROM activity)
    AS DECIMAL(10,2)
    ) AS fraction
FROM tb2;
