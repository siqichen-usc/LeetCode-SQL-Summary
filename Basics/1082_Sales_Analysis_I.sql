SELECT TOP 1 WITH TIES seller_id
FROM Sales
GROUP BY seller_id
ORDER BY SUM(price) DESC;
