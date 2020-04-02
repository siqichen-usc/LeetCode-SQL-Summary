-- Solution: CASE WHEN
SELECT CAST(
    AVG(
        CASE
            WHEN order_date = customer_pref_delivery_date THEN 100.0
            ELSE 0
        END
       )
    AS DECIMAL(5,2)
) AS immediate_percentage
FROM Delivery;
