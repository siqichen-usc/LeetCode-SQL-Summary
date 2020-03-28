WITH tb1 AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) AS r
    FROM student
)

SELECT [America],[Asia],[Europe]
FROM tb1
PIVOT (
    MIN(name) FOR continent IN ([America],[Asia],[Europe])
) pvt;
