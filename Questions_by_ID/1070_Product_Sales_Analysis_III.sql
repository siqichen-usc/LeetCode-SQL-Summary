-- Solution 1: Window Function, Subquery
SELECT product_id, year AS first_year, quantity, price
FROM (
    SELECT *, DENSE_RANK() OVER (PARTITION BY product_id ORDER BY year) AS r
    FROM Sales
) tb1
WHERE r = 1;



-- Solution 2: Subquery
SELECT product_id, year AS first_year, quantity, price
FROM Sales s
WHERE year = (
    SELECT TOP 1 year
    FROM Sales
    WHERE product_id = s.product_id
    ORDER BY year
);



-- Solution 3: Subquery, Join
WITH tb1 AS (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)

SELECT s.product_id, first_year, quantity, price
FROM Sales s
JOIN tb1
ON s.product_id = tb1.product_id AND s.year = tb1.first_year;
