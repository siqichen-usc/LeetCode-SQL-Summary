-- Solution 1: Join, Subquery
WITH tb1 AS (
    SELECT s.buyer_id, p.product_name
    FROM Sales s
    JOIN Product p
    ON s.product_id = p.product_id
)

SELECT buyer_id
FROM tb1
WHERE product_name = 'S8'
EXCEPT
SELECT buyer_id
FROM tb1
WHERE product_name = 'iPhone';



-- Solution 2: Join, Subquery
WITH tb1 AS (
    SELECT s.buyer_id, p.product_name
    FROM Sales s
    JOIN Product p
    ON s.product_id = p.product_id
)

SELECT DISTINCT buyer_id
FROM tb1
WHERE product_name = 'S8' AND buyer_id NOT IN (
    SELECT buyer_id
    FROM tb1
    WHERE product_name = 'iPhone'
);
