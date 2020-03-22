SELECT w2.id
FROM weather w1
JOIN weather w2
    ON DATEADD(day,1,w1.recorddate) = w2.recorddate
WHERE w1.temperature < w2.temperature;
