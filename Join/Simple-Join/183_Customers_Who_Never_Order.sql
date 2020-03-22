SELECT c.name AS customers
FROM customers c
LEFT JOIN orders o
    ON c.id = o.customerid
WHERE o.id IS NULL;
