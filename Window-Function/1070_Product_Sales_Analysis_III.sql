SELECT product_id, year AS first_year, quantity, price
FROM (
    SELECT *, DENSE_RANK() OVER (PARTITION BY product_id ORDER BY year) AS r
    FROM Sales
) tb1
WHERE r = 1;
