-- Solution 1: CASE WHEN, Subquery
WITH tb1 AS (
    SELECT DISTINCT customer_id, product_name,
        CASE
            WHEN product_name IN ('A','B') THEN 1
            WHEN product_name = 'C' THEN -1
            ELSE 0
        END AS c
    FROM Orders
)

SELECT *
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM tb1
    GROUP BY customer_id
    HAVING SUM(c) = 2
);



-- Solution 2: Subquery
SELECT *
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE product_name = 'A'
)
    AND customer_id IN (
        SELECT customer_id
        FROM Orders
        WHERE product_name = 'B'
)
    AND customer_id NOT IN (
        SELECT customer_id
        FROM Orders
        WHERE product_name = 'C'
);
