WITH tb1 AS (
    SELECT ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) AS r,
        IIF(continent = 'America', name, NULL) AS America,
        IIF(continent = 'Asia', name, NULL) AS Asia,
        IIF(continent = 'Europe', name, NULL) AS Europe
    FROM student
)

SELECT MIN(America) AS America, MIN(Asia) AS Asia, MIN(Europe) AS Europe
FROM tb1
GROUP BY r;
