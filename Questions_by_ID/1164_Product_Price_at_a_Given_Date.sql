-- Solution 1: Window Function, Subquery, Join
WITH tb1 AS (
    SELECT product_id, new_price
    FROM (
        SELECT product_id, new_price,
            ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS r
        FROM Products
        WHERE change_date <= '2019-08-16'
    ) rank
    WHERE r = 1
)

SELECT p.product_id, ISNULL(new_price,10) AS price
FROM (
    SELECT DISTINCT product_id 
    FROM Products
) p
LEFT JOIN tb1
ON p.product_id = tb1.product_id;



-- Solution 2: Subquery, Join
WITH tb1 AS (
    SELECT product_id, MAX(change_date) AS date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
),
tb2 AS (
    SELECT p.product_id, p.new_price
    FROM Products p
    JOIN tb1
    ON p.product_id = tb1.product_id AND p.change_date = tb1.date
)

SELECT p.product_id, ISNULL(new_price,10) AS price
FROM (
    SELECT DISTINCT product_id 
    FROM Products
) p
LEFT JOIN tb2
ON p.product_id = tb2.product_id;
