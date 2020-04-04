-- Solution: CASE WHEN, Subquery, Join
SELECT c.country_name, w.weather_type
FROM (
    SELECT country_id,
        CASE
            WHEN AVG(weather_state*1.0) <= 15 THEN 'Cold'
            WHEN AVG(weather_state*1.0) >= 25 THEN 'Hot'
            ELSE 'Warm'
        END AS weather_type
    FROM Weather
    WHERE LEFT(day,7) = '2019-11'
    GROUP BY country_id
) w
JOIN Countries c
ON w.country_id = c.country_id;
