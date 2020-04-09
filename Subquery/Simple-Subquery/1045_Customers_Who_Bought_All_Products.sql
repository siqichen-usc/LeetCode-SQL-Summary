SELECT customer_id
FROM customer
GROUP BY customer_id
-- the number of different products bought by customer equals to number of existing products
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM product);
