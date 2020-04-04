-- Solution: CASE WHEN
SELECT query_name, 
    CAST(
        AVG(rating*1.0/position) 
        AS DECIMAL(10,2)
    ) AS quality,
    CAST(
        AVG(CASE WHEN rating < 3 THEN 100.0 ELSE 0 END)
        AS DECIMAL(10,2)
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
