WITH tb1 AS (
    -- Numbering student from each continent separately by their name alphabetically
    SELECT *, ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) AS r
    FROM student
)

-- each row will be a group of student name of whom from different continent and have same numbering
SELECT [America],[Asia],[Europe]
FROM tb1
PIVOT (
    MIN(name) FOR continent IN ([America],[Asia],[Europe])
) pvt;
