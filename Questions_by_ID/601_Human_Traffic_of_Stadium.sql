-- Solution 1: Window Function, Subquery
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



-- Solution 2: Join, Subquery
WITH tb1 AS (
    SELECT s1.id AS id1, s2.id AS id2, s3.id AS id3
    FROM stadium s1, stadium s2, stadium s3
    WHERE s1.id + 1 = s2.id AND s2.id + 1 = s3.id
        AND s1.people >= 100 AND s2.people >= 100 AND s3.people >= 100
)


SELECT *
FROM stadium
WHERE id IN (SELECT id1 id FROM tb1
             UNION 
             SELECT id2 FROM tb1
             UNION 
             SELECT id3 FROM tb1);
