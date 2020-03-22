-- Solution 1: Join
SELECT c.name AS customers
FROM customers c
LEFT JOIN orders o
    ON c.id = o.customerid
WHERE o.id IS NULL;



-- Solution 2: Subquery
SELECT name AS customers
FROM customers
WHERE id NOT IN (SELECT customerid FROM Orders);
