SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
on s.product_id = p.product_id;
