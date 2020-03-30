SELECT product_id, product_name
FROM Product
WHERE product_id IN (
    SELECT product_id
    FROM Sales
    WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31'
    EXCEPT
    SELECT product_id
    FROM Sales
    WHERE NOT sale_date BETWEEN '2019-01-01' AND '2019-03-31'
);
