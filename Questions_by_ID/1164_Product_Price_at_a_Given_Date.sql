-- Solution 1: Window Function, Subquery, Join
WITH tb1 AS (
    SELECT product_id, new_price
    FROM (
        SELECT product_id, new_price,
            -- use ROW_NUMBER() to find the last time when the price of each product was changed before '2019-08-16'
            -- so if the price of a product had not been changed before '2019-08-16', the product will not be included in tb1
            ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS r
        FROM Products
        WHERE change_date <= '2019-08-16'
    ) rank
    WHERE r = 1
)

-- if a product does not in tb1, which means it has no price change before '2019-08-16'
-- assign the original price 10 to that product
SELECT p.product_id, ISNULL(new_price,10) AS price
FROM (
    SELECT DISTINCT product_id 
    FROM Products
) p
LEFT JOIN tb1
ON p.product_id = tb1.product_id;



-- Solution 2: Subquery, Join
-- find the date of last time when the price of each product was changed before '2019-08-16''
WITH tb1 AS (
    SELECT product_id, MAX(change_date) AS date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
),
-- find the latest price of product which had been changed price for at least one time before '2019-08-16'
tb2 AS (
    SELECT p.product_id, p.new_price
    FROM Products p
    JOIN tb1
    ON p.product_id = tb1.product_id AND p.change_date = tb1.date
)

-- if a product does not in tb2, which means it has no price change before '2019-08-16'
-- assign the original price 10 to that product
SELECT p.product_id, ISNULL(new_price,10) AS price
FROM (
    SELECT DISTINCT product_id 
    FROM Products
) p
LEFT JOIN tb2
ON p.product_id = tb2.product_id;
