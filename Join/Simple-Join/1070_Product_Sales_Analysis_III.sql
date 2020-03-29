WITH tb1 AS (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)

SELECT s.product_id, first_year, quantity, price
FROM Sales s
JOIN tb1
ON s.product_id = tb1.product_id AND s.year = tb1.first_year;
