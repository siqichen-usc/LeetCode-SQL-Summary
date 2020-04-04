SELECT u.product_id, 
    CAST(
        SUM(price*units) * 1.0 / SUM(units) 
        AS DECIMAL(10,2)
    ) AS average_price
FROM UnitsSold u
JOIN Prices p
ON u.product_id = p.product_id 
    AND u.purchase_date >= p.start_date 
    AND u.purchase_date <= p.end_date
GROUP BY u.product_id;
