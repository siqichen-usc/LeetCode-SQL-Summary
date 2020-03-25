-- Solution 1: Window Function, Subquery
SELECT CAST(SUM(TIV_2016) AS DECIMAL(10,2)) AS TIV_2016
FROM (
    SELECT TIV_2016,
        COUNT(*) OVER (PARTITION BY TIV_2015) AS count_2015,
        COUNT(*) OVER (PARTITION BY LAT, LON) AS count_loc
    FROM insurance
) tb1
WHERE count_2015 > 1 AND count_loc = 1;



-- Solution 2: Subquery
SELECT CAST(SUM(TIV_2016) AS DECIMAL(10,2)) AS TIV_2016
FROM insurance
WHERE TIV_2015 IN (
    SELECT TIV_2015 
    FROM insurance 
    GROUP BY TIV_2015 
    HAVING COUNT(*) > 1
    )
AND CONCAT(LAT,'_',LON) IN (
    SELECT CONCAT(LAT,'_',LON) 
    FROM insurance 
    GROUP BY LAT, LON 
    HAVING COUNT(*) = 1
    );
