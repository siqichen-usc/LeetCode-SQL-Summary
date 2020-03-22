SELECT id
FROM (
    SELECT *, LAG(temperature) OVER (ORDER BY recorddate) AS prev_temp,
        LAG(recorddate) OVER (ORDER BY recorddate) prev_date
    FROM weather
    ) tb1
WHERE DATEADD(day,1,prev_date) = recorddate AND prev_temp < temperature
