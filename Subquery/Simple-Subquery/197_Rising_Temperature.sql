SELECT id
FROM (
    SELECT *, 
        -- Get temperature and date of previous record date, if none get null
        LAG(temperature) OVER (ORDER BY recorddate) AS prev_temp,
        LAG(recorddate) OVER (ORDER BY recorddate) prev_date
    FROM weather
    ) tb1
WHERE DATEADD(day,1,prev_date) = recorddate AND prev_temp < temperature;
