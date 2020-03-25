WITH tb1 AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY id) AS r
    FROM stadium
    WHERE people >=100
),
tb2 AS (
    SELECT id, visit_date, people, COUNT(*) OVER (PARTITION BY id-r) AS num
    FROM tb1
)

SELECT id, visit_date, people
FROM tb2
WHERE num >= 3;
